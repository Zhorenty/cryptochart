import 'package:cryptochart/core/constants/colors.dart';
import 'package:cryptochart/view/screens/currency_rate/widgets/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../viewmodel/token_provider.dart';

class CurrencyRateScreen extends StatelessWidget {
  const CurrencyRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TokenProvider provider = TokenProvider();
    final watcher = context.watch<TokenProvider>();
    final pair = context.watch<TokenProvider>().currentPair;
    var dateOfReceipt = DateFormat.Hms().format(DateTime.now());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Currency Rate',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontFamily: 'Outfit',
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 27, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 25),
              FutureBuilder(
                future: provider.getTokensPrice(
                    pair.token1!.contract, pair.token2!.contract),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '1 ${pair.token2!.name} = ${provider.result?.toStringAsFixed(7)}... ${pair.token1!.name}',
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Outfit',
                          color: ColorConstants.mainColor),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              PriceChart(),
              const Spacer(),
              Center(
                child: Text('Relevant on - $dateOfReceipt',
                    //watcher.dateOfReceipt
                    style: const TextStyle(
                        color: ColorConstants.mainColor,
                        fontSize: 25,
                        fontFamily: 'Outfit')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
