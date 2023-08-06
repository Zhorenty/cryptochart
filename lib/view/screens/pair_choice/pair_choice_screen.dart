import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/viewmodel/token_provider.dart';
import 'widgets/compare_widget.dart';
import 'widgets/token_button_widget.dart';
import 'widgets/watch_button_widget.dart';

/// TODO: docs
class PairChoiceScreen extends StatelessWidget {
  const PairChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pair = context.watch<TokenProvider>().currentPair;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Pair Choice',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontFamily: 'Outfit',
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: 35,
                    top: 20,
                    child: TokenButtonWidget(
                      isFirstToken: true,
                      tokenName: pair.token2!.name,
                    ),
                  ),
                  Positioned(
                    right: 35,
                    top: 20,
                    child: TokenButtonWidget(
                      isFirstToken: false,
                      tokenName: pair.token1!.name,
                    ),
                  ),
                  const Positioned(
                    top: 65,
                    left: 175,
                    child: CompareWidget(),
                  ),
                  const Positioned(
                    height: 60,
                    width: 400,
                    left: 15,
                    bottom: 35,
                    child: WatchButtonWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
