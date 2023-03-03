import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:cryptochart/core/constants/querys/timestemp_query.dart';
import 'package:cryptochart/core/constants/querys/token_query.dart';
import 'package:cryptochart/core/constants/uniswap_url.dart';
import 'package:cryptochart/model/pair_hour_token.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:core';

import '../core/constants/tokens.dart';
import '../model/pair.dart';
import '../model/token.dart';

enum LoadState {
  loading,
  loaded,
  error,
}

class TokenProvider extends ChangeNotifier {
  Pair currentPair = Pair(Tokens.allTokens[0], Tokens.allTokens[1]);
  String dateOfReceipt = '';
  double? result = 0;
  String pair = '';
  List<PairHourTokenModel> pairsHourTokenModel = [];
  late LoadState loadState;
  late Timer fetchingTimer;
  bool isTimerStart = false;

  Future<void> getTokensPrice() async {
    loadState = LoadState.loading;
    try {
      final response = await http.post(
        Uri.parse(UniswapApiConstant.url),
        body: jsonEncode(
          {
            'query': TokenQueryConstant.buildQuery(
              currentPair.token1!.contract,
              currentPair.token2!.contract,
            ),
          },
        ),
      );
      print(pair);

      final data = jsonDecode(response.body);
      final price = data['data']['pairs'][0]['token0Price'];
      pair = data['data']['pairs'][0]['id'];
      result = double.tryParse(price);
      pairsHourTokenModel = await _getPricesOfHour(pair);

      loadState = LoadState.loaded;
    } catch (e) {
      loadState = LoadState.error;
    }
    dateOfReceipt = DateFormat.Hms().format(DateTime.now());
    if (!isTimerStart) {
      setRefreshOnTime();
    }
    notifyListeners();
  }

  setRefreshOnTime() {
    Timer.periodic(const Duration(seconds: 15), (_) => getTokensPrice());
    isTimerStart = true;
  }

  Future<List<PairHourTokenModel>> _getPricesOfHour(String pairAddress) async {
    final response = await http.post(
      Uri.parse(UniswapApiConstant.url),
      body: jsonEncode(
        {
          'query': TimestempQueryConstant.buildQuery(pairAddress),
        },
      ),
    );
    final List<dynamic> dataJson = (jsonDecode(response.body)
        as Map<String, dynamic>)['data']['pairHourDatas'];
    final List<PairHourTokenModel> pairsHourData =
        dataJson.map((json) => PairHourTokenModel.fromJson(json)).toList();
    return pairsHourData;
  }

  void changeToken1(TokenModel token) {
    if (token == currentPair.token1) {
      currentPair.token1 = currentPair.token2;
    }
    currentPair.token2 = token;
    notifyListeners();
  }

  void changeToken2(TokenModel token) {
    if (token == currentPair.token2) {
      currentPair.token2 = currentPair.token1;
    }
    currentPair.token1 = token;
    notifyListeners();
  }
}
