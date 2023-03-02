import 'package:cryptochart/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/tokens.dart';
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
              FutureBuilder(
                future: provider.getTokensPrice(
                    pair.token1!.contract, pair.token2!.contract),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // return Text('RESULT : ${snapshot.data!.toStringAsFixed(5)}');
                    return Text(
                      '1 ${pair.token2!.name} = ${watcher.result.replaceRange(7, watcher.result.length, '')} ${pair.token1!.name}',
                      style: TextStyle(fontSize: 20),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              Center(
                child: Text('Relevant on: ${watcher.dateOfReceipt}',
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
