import 'dart:convert';
import 'package:http/http.dart' as http;

const String uniswapApiUrl =
    'https://api.thegraph.com/subgraphs/name/uniswap/uniswap-v2';

Future<double?> getTokensTimestemp() async {
  final response = await http.post(Uri.parse(uniswapApiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'query': '''
        query {
  pairDayDatas(
    where: {
      pairAddress: "0x0d4a11d5eeaac28ec3f61d100daf4d40471f1852"
      date_gte: 1665597600 
      date_lte: 1665697600 
    }
  ) {
    date
    token0 {
      id
      symbol
    }
    token1 {
      id
      symbol
    }
    dailyVolumeToken0
    dailyVolumeToken1
    dailyVolumeUSD
    dailyTxns
    # priceUSD
  }
}
      '''
      }));

  final data = jsonDecode(response.body);
  final price = data['data']['pairDayDatas'][0]['dailyVolumeToken0'];
  return double.tryParse(price);
}
