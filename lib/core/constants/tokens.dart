import '../../model/token.dart';

class Tokens {
  static const firstInitialToken = TokenModel(
    name: 'ETH',
    contract: '0x2170Ed0880ac9A755fd29B2688956BD959F933F8',
  );
  static const secondInitialToken = TokenModel(
    name: 'CAKE',
    contract: '0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82',
  );

  static const allTokens = <TokenModel>[
    TokenModel(
        name: 'WBNB', contract: '0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c'),
    TokenModel(
        name: 'USDT', contract: '0x55d398326f99059fF775485246999027B3197955'),
    TokenModel(
        name: 'BTCB', contract: '0x7130d2A12B9BCbFAe4f2634d864A1Ee1Ce3Ead9c'),
    TokenModel(
        name: 'BUSD', contract: '0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56'),
    TokenModel(
        name: 'ETH', contract: '0x2170Ed0880ac9A755fd29B2688956BD959F933F8'),
    TokenModel(
        name: 'CAKE', contract: '0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82'),
    TokenModel(
        name: 'USDC', contract: '0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d'),
  ];
}
