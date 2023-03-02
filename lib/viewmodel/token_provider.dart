import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:core';

import '../core/constants/tokens.dart';
import '../model/pair.dart';
import '../model/token.dart';

class TokenProvider extends ChangeNotifier {
  // мб фетчинг таймер добавить
  Pair currentPair = Pair(Tokens.allTokens[0], Tokens.allTokens[1]);
  // late Timer fetchingTimer;
  String dateOfReceipt = '';
  String result = '0';
  //
  final String uniswapApiUrl =
      'https://api.thegraph.com/subgraphs/name/uniswap/uniswap-v2';
  Future<double?> getTokensPrice(
      String token1Address, String token2Address) async {
    final response = await http.post(Uri.parse(uniswapApiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'query': '''
          {
            pairs(where: { token0: "$token1Address", token1: "$token2Address" }) {
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
    result = price;
    return double.tryParse(price);
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
