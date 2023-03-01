import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../core/constants/tokens.dart';
import '../model/pair.dart';
import '../model/token.dart';

class TokenProvider extends ChangeNotifier {
  // мб фетчинг таймер добавить
  Pair currentPair = Pair(Tokens.allTokens[0], Tokens.allTokens[1]);

  String dateOfReceipt = '';
  String result = '0';
  //
  final String uniswapApiUrl =
      'https://api.thegraph.com/subgraphs/name/uniswap/uniswap-v2';
  Future<double?> getTokensPrice(String firstToken, String secondToken) async {
    final response = await http.post(Uri.parse(uniswapApiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'query': '''
          {
            pairs(where: { token0: "$firstToken", token1: "$secondToken" }) {
              id
              token0Price
              token0 {
              id
             name
            }
          }
        }
      '''
        }));

    final data = jsonDecode(response.body);
    final price = data['data']['pairs'][0]['token0Price'];
    // final description = data['data']['pairs'][0]['token0']['name'];
    return double.tryParse(price);
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
