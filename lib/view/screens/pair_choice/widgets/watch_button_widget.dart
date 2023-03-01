import 'package:cryptochart/core/constants/colors.dart';
import 'package:cryptochart/view/screens/currency_rate/currency_rate_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WatchButtonWidget extends StatelessWidget {
  const WatchButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorConstants.mainColor),
      ),
      child: const Text('WATCH'),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CurrencyRateScreen()),
        );
      },
    );
  }
}
