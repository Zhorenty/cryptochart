import 'package:cryptochart/core/constants/colors.dart';
import 'package:cryptochart/view/screens/currency_rate/currency_rate_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../viewmodel/token_provider.dart';

class WatchButtonWidget extends StatelessWidget {
  const WatchButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pair = context.watch<TokenProvider>().currentPair;
    final reader = context.read<TokenProvider>();
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: const MaterialStatePropertyAll(Colors.grey),
        elevation: const MaterialStatePropertyAll(5),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
        backgroundColor: MaterialStateProperty.all(ColorConstants.mainColor),
      ),
      child: const Text(
        'WATCH',
        style: TextStyle(fontFamily: 'Outfit', fontSize: 28),
      ),
      onPressed: () {
        reader.getTokensPrice(pair.token1!.contract, pair.token2!.contract);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CurrencyRateScreen()),
        );
      },
    );
  }
}
