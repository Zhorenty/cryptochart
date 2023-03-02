import 'dart:convert';
import 'package:cryptochart/core/constants/querys/timestemp_query.dart';
import 'package:cryptochart/core/constants/uniswap_url.dart';
import 'package:http/http.dart' as http;

import 'package:cryptochart/viewmodel/token_provider.dart';
import 'package:flutter/material.dart';

class GraphProvider with ChangeNotifier {
  final pairAddress = TokenProvider().pair;

  Future<double?> getTokensPrice(
      String token1Address, String token2Address) async {
    final response = await http.post(Uri.parse(UniswapApiConstant.url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {'query': TimestempQueryConstant.buildQuery(pairAddress)}));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
    } else {
      throw Exception('timestemp fetching error');
    }
  }
}
