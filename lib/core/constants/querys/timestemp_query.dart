class TimestempQueryConstant {
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
/*
query {
  pairDayDatas(where: {
    pairAddress: "0xaa873c9da6541f13c89416c17271b4c21bf7b2d7",
    date_gt: 1644739200},
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

*/