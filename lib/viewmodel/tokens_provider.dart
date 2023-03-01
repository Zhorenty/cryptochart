import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:web3dart/web3dart.dart';

import '../core/constants/tokens.dart';
import '../model/pair.dart';
import '../model/token.dart';

class PancakeSwapProvider with ChangeNotifier {
  final pancakeSwapContractAddress =
      '0x10ED43C718714eb63d5aA57B78B54704E256024E';
  String ethereumClientUrl = 'https://bsc-dataseed1.binance.org';

  late Client httpClient;
  late Web3Client ethereumClient;
  late Timer fetchingTimer;

  Pair currentPair = Pair(Tokens.allTokens[0], Tokens.allTokens[1]);

  String dateOfReceipt = '';
  String result = '0';

  void init() {
    httpClient = Client();
    ethereumClient = Web3Client(ethereumClientUrl, httpClient);
  }

  Future<DeployedContract> _getContract(String abi) async {
    final contract = DeployedContract(
      ContractAbi.fromJson(abi, 'pancakeSwapAbi'),
      EthereumAddress.fromHex(
        pancakeSwapContractAddress.toLowerCase(),
      ),
    );
    return contract;
  }

  Future<void> getPrice(String token1Address, String token2Address) async {
    String abi = await rootBundle.loadString('assets/abi/abi.json');
    DeployedContract contract = await _getContract(abi);

    final getThePriceContract = contract.function('getAmountsOut');
    final gettingThePrice = await ethereumClient.call(
      contract: contract,
      function: getThePriceContract,
      params: <dynamic>[
        BigInt.from(1),
        [
          EthereumAddress.fromHex(token1Address),
          EthereumAddress.fromHex(token2Address),
        ],
      ],
    );
    dateOfReceipt = DateFormat.Hms().format(DateTime.now());
    result = gettingThePrice.first[1].toString();

    fetchingTimer = Timer.periodic(const Duration(seconds: 25),
        (_) => getPrice(token1Address, token2Address));
    notifyListeners();
  }

  void changeToken1(TokenModel token) {
    if (token == currentPair.token2) {
      currentPair.token2 = currentPair.token1;
    }
    currentPair.token1 = token;
    notifyListeners();
  }

  void changeToken2(TokenModel token) {
    if (token == currentPair.token1) {
      currentPair.token1 = currentPair.token2;
    }
    currentPair.token2 = token;
    notifyListeners();
  }
}
