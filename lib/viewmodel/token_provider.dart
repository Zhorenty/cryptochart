import 'dart:async';
import 'dart:core';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '/core/constants/querys/timestamp_query.dart';
import '/core/constants/querys/token_query.dart';
import '/core/constants/uniswap_url.dart';
import '/core/constants/tokens.dart';
import '/model/pair_hour_token.dart';
import '/model/pair.dart';
import '/model/token.dart';

/// TODO: docs
enum LoadState {
  loading,
  loaded,
  error,
}

/// TODO: docs
class TokenProvider extends ChangeNotifier {
  /// TODO: docs
  Pair currentPair = Pair(Tokens.allTokens[5], Tokens.allTokens[1]);

  /// TODO: docs
  String dateOfReceipt = '';

  /// TODO: docs
  double? result = 0;

  /// TODO: docs
  String pair = '';

  /// TODO: docs
  List<PairHourTokenModel> pairsHourTokenModel = [];

  /// TODO: docs
  bool isTimerStart = false;

  /// TODO: docs
  late LoadState loadState;

  /// TODO: docs
  late Timer fetchingTimer;

  /// TODO: docs
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

  /// TODO: docs
  setRefreshOnTime() {
    Timer.periodic(const Duration(seconds: 15), (_) => getTokensPrice());
    isTimerStart = true;
  }

  /// TODO: docs
  Future<List<PairHourTokenModel>> _getPricesOfHour(String pairAddress) async {
    final response = await http.post(
      Uri.parse(UniswapApiConstant.url),
      body: jsonEncode(
        {
          'query': TimestampQueryConstant.buildQuery(pairAddress),
        },
      ),
    );
    final List<dynamic> dataJson = (jsonDecode(response.body)
        as Map<String, dynamic>)['data']['pairDayDatas'];
    final List<PairHourTokenModel> pairsHourData =
        dataJson.map((json) => PairHourTokenModel.fromJson(json)).toList();
    return pairsHourData;
  }

  /// TODO: docs
  void changeToken1(TokenModel token) {
    if (token == currentPair.token1) {
      currentPair.token1 = currentPair.token2;
    }
    currentPair.token2 = token;
    notifyListeners();
  }

  /// TODO: docs
  void changeToken2(TokenModel token) {
    if (token == currentPair.token2) {
      currentPair.token2 = currentPair.token1;
    }
    currentPair.token1 = token;
    notifyListeners();
  }
}
