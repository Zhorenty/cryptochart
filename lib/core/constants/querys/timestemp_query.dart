class TimestempQueryConstant {
  static String buildQuery(String pairAddress) {
    return '''
      query {
        pairHourDatas(where: {
          pair: "$pairAddress", hourStartUnix_gt: 1646121600 },
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
