import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/tokens.dart';
import '../../../viewmodel/token_provider.dart';
import 'widgets/token_button_widget.dart';
import 'widgets/watch_button_widget.dart';

class PairChoiceScreen extends StatelessWidget {
  const PairChoiceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TokenProvider provider = TokenProvider();
    final pair = context.watch<TokenProvider>().currentPair;
    final reader = context.read<TokenProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Pair Choice',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: 'Outfit',
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TokenButtonWidget(
              isFirstToken: true,
              tokenName: pair.token1!.name,
            ),
            const WatchButtonWidget(),
            FutureBuilder<double?>(
              future: provider.getTokensPrice(
                  Tokens.allTokens[0].contract, Tokens.allTokens[1].contract),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('ETH/USDT: ${snapshot.data!.toStringAsFixed(5)}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
