class TokenQueryConstant {
  static String buildQuery(String token1Address, String token2Address) {
    return '''
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
      ''';
  }
}
