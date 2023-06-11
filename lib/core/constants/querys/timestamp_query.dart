class TimestampQueryConstant {
  static String buildQuery(String pairAddress) {
    int timestampMinus12Days =
        (DateTime.now().millisecondsSinceEpoch / 1000).round() -
            (12 * 24 * 60 * 60);

    return '''
      query {
        pairDayDatas(where: {
          pairAddress: "$pairAddress",
          date_gt: $timestampMinus12Days},
          orderBy: date,
          orderDirection: asc,
          first: 12) {
          token0 {
            symbol
          }
          token1 {
            symbol
          }
          date
          reserve0
          reserve1
          dailyVolumeToken0
          dailyVolumeToken1
          dailyVolumeUSD
        }
      }
    ''';
  }
}
