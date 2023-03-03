import 'package:cryptochart/core/constants/colors.dart';
import 'package:cryptochart/core/constants/errors.dart';
import 'package:cryptochart/view/screens/currency_rate/widgets/chart_widget.dart';
import 'package:cryptochart/view/screens/currency_rate/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../viewmodel/token_provider.dart';

class CurrencyRateScreen extends StatefulWidget {
  const CurrencyRateScreen({super.key});

  @override
  State<CurrencyRateScreen> createState() => _CurrencyRateScreenState();
}

class _CurrencyRateScreenState extends State<CurrencyRateScreen> {
  @override
  void initState() {
    Provider.of<TokenProvider>(context, listen: false).getTokensPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<TokenProvider>();
    return Scaffold(
      backgroundColor: ColorConstants.secondaryWhiteColor,
      appBar: AppBar(
        title: const Text(
          'Currency Rate',
          style: TextStyle(
            color: ColorConstants.secondaryBlackColor,
            fontSize: 28,
            fontFamily: 'Outfit',
          ),
        ),
        elevation: 0,
        backgroundColor: ColorConstants.secondaryWhiteColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 27,
            color: ColorConstants.secondaryBlackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Consumer<TokenProvider>(
          builder: (context, tokenProvider, _) {
            switch (tokenProvider.loadState) {
              case LoadState.loading:
                return const Center(
                    child: SpinKitSquareCircle(
                  duration: Duration(milliseconds: 800),
                  size: 80,
                  color: ColorConstants.primaryColor,
                ));
              case LoadState.error:
                return const MistakeWidget(
                    message: ErrorConstants.fetchingError);
              case LoadState.loaded:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      '1 ${tokenProvider.currentPair.token2!.name} = ${tokenProvider.result?.toStringAsFixed(7)} ${tokenProvider.currentPair.token1!.name}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Outfit',
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    Card(
                      child: PriceChart(
                        pairsHourTokenModel: tokenProvider.pairsHourTokenModel,
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Text(
                        'Relevant on - ${watch.dateOfReceipt}',
                        style: const TextStyle(
                          color: ColorConstants.primaryColor,
                          fontSize: 25,
                          fontFamily: 'Outfit',
                        ),
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
