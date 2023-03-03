class TimestempQueryConstant {
  static String buildQuery(String pairAddress) {
    int timestampMinus12Hours =
        (DateTime.now().millisecondsSinceEpoch / 1000).round() - 43200;
    return '''
      query {
        pairHourDatas(where: {
          pair: "$pairAddress", hourStartUnix_gt: $timestampMinus12Hours },
          orderBy: hourStartUnix, orderDirection: asc,
          first: 12) {
          pair {
            token0 {
              symbol
            }
            token1 {
              symbol
            }
          }
          hourStartUnix
          reserve0
          reserve1
        }
      }
    ''';
  }
}
