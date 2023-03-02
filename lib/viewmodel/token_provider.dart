import 'dart:convert';
import 'package:cryptochart/core/constants/querys/token_query.dart';
import 'package:cryptochart/core/constants/uniswap_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  // late Timer fetchingTimer;
  String dateOfReceipt = '';
  double? result = 0;
  String pair = '';
  Future<void> getTokensPrice(
      String token1Address, String token2Address) async {
    try {
      final response = await http.post(Uri.parse(UniswapApiConstant.url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'query':
                TokenQueryConstant.buildQuery(token1Address, token2Address),
          }));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final price = data['data']['pairs'][0]['token0Price'];
        pair = data['data']['pairs'][0]['id'];
        result = double.tryParse(price);
      } else {
        throw Exception('token fetching error ');
      }
    } catch (e) {
      throw Exception(e);
    }
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
