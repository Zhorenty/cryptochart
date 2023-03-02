import 'package:flutter/material.dart';

import 'package:cryptochart/core/constants/colors.dart';
import '../../currency_choice/currency_choice_screen.dart';

class TokenButtonWidget extends StatelessWidget {
  final bool isFirstToken;
  final String tokenName;

  const TokenButtonWidget(
      {Key? key, required this.isFirstToken, required this.tokenName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        color: ColorConstants.mainColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => CurrencyChoiceScreen(
                      isFirstToken: isFirstToken,
                    )),
          );
        },
        child: Center(
          child: Text(
            tokenName,
            style: const TextStyle(
                fontSize: 32,
                color: ColorConstants.secondaryColor,
                fontFamily: 'Outfit'),
          ),
        ),
      ),
    );
  }
}