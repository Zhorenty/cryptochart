import '../../model/token.dart';

class Tokens {
  static const firstInitialToken = TokenModel(
    name: 'WBTC',
    contract: '0x2260fac5e5542a773aa44fbcfedf7c193bc2c599',
  );
  static const secondInitialToken = TokenModel(
    name: 'WETH',
    contract: '0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2',
  );

  static const allTokens = <TokenModel>[
    TokenModel(
        name: 'WBTC', contract: '0x2260fac5e5542a773aa44fbcfedf7c193bc2c599'),
    TokenModel(
        name: 'WETH', contract: '0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2'),
    TokenModel(
        name: 'DAI', contract: '0x6b175474e89094c44da98b954eedeac495271d0f'),
    TokenModel(
        name: 'USDC', contract: '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48'),
    TokenModel(
        name: 'UNI', contract: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984'),
    TokenModel(
        name: 'SUSHI', contract: '0x6b3595068778dd592e39a122f4f5a5cf09c90fe2'),
    TokenModel(
        name: 'LINK', contract: '0x514910771af9ca656af840dff83e8264ecf986ca'),
  ];
}
