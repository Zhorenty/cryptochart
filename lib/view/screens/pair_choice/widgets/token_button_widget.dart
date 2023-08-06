import 'package:flutter/material.dart';

import '/core/constants/colors.dart';
import '/view/screens/currency_choice/currency_choice_screen.dart';

/// TODO: docs
class TokenButtonWidget extends StatelessWidget {
  const TokenButtonWidget({
    super.key,
    this.isFirstToken = false,
    required this.tokenName,
  });

  /// TODO: docs
  final bool isFirstToken;

  /// TODO: docs
  final String tokenName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CurrencyChoiceScreen(
              isFirstToken: isFirstToken,
            ),
          ),
        );
      },
      child: Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorConstants.background.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          color: ColorConstants.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            tokenName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: ColorConstants.secondary,
              fontFamily: 'Outfit',
            ),
          ),
        ),
      ),
    );
  }
}
