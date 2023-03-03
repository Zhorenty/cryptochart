import 'package:cryptochart/core/constants/colors.dart';
import 'package:cryptochart/view/screens/currency_rate/currency_rate_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../viewmodel/token_provider.dart';

class WatchButtonWidget extends StatelessWidget {
  const WatchButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenProvider = context.read<TokenProvider>();
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor:
            const MaterialStatePropertyAll(ColorConstants.secondaryBlackColor),
        elevation: const MaterialStatePropertyAll(8),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
        backgroundColor: MaterialStateProperty.all(ColorConstants.primaryColor),
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
