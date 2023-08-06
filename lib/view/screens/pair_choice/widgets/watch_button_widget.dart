import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/constants/colors.dart';
import '/view/screens/currency_rate/currency_rate_screen.dart';
import '/viewmodel/token_provider.dart';

/// TODO: docs
class WatchButtonWidget extends StatelessWidget {
  const WatchButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenProvider = context.read<TokenProvider>();
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: const MaterialStatePropertyAll(ColorConstants.background),
        elevation: const MaterialStatePropertyAll(8),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
        backgroundColor: MaterialStateProperty.all(ColorConstants.primary),
      ),
      child: const Text(
        'WATCH',
        style: TextStyle(
            fontFamily: 'Outfit', fontSize: 32, fontWeight: FontWeight.w600),
      ),
      onPressed: () {
        tokenProvider.getTokensPrice();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CurrencyRateScreen()),
        );
      },
    );
  }
}
