import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodel/token_provider.dart';
import 'widgets/token_button_widget.dart';
import 'widgets/watch_button_widget.dart';

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
                  Positioned(
                    top: 65,
                    left: 175,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      width: 80,
                      height: 70,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 30,
                      ),
                    ),
                  ),
                  const Positioned(
                    height: 50,
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
