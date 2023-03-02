import 'dart:convert';
import 'package:cryptochart/core/constants/querys/timestemp_query.dart';
import 'package:cryptochart/core/constants/uniswap_url.dart';
import 'package:cryptochart/model/pair_hour_token.dart';
import 'package:http/http.dart' as http;

import 'package:cryptochart/viewmodel/token_provider.dart';
import 'package:flutter/material.dart';

class GraphProvider with ChangeNotifier {
  final pairAddress = TokenProvider().pair;

  Future<List<PairHourTokenModel>> getTokensPrice(String pairAddress) async {
    final response = await http.post(Uri.parse(UniswapApiConstant.url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {'query': TimestempQueryConstant.buildQuery(pairAddress)}));
    try {
      final data = result.data!['pairHourDatas'];
      for (int i = 0; i < data.length; i++) {
        final hourStartUnix = DateTime.fromMillisecondsSinceEpoch(
            data[i]['hourStartUnix'] * 1000);
        final price = data[i]['reserve1'] / data[i]['reserve0'];
        chartData.add(SalesData(hourStartUnix, price));
      }
      final List<dynamic> dataJson = jsonDecode(response.body);
      return dataJson.map((json) => PairHourTokenModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
