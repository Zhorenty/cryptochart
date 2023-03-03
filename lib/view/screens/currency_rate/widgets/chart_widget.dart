// ignore_for_file: library_private_types_in_public_api
import 'package:cryptochart/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:cryptochart/model/pair_hour_token.dart';

import '../../../../viewmodel/token_provider.dart';

class PriceChart extends StatefulWidget {
  final List<PairHourTokenModel> pairsHourTokenModel;
  const PriceChart({
    Key? key,
    required this.pairsHourTokenModel,
  }) : super(key: key);
  @override
  _PriceChartState createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> {
  @override
  void initState() {
    super.initState();
    Provider.of<TokenProvider>(context, listen: false).getTokensPrice();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      tooltipBehavior: TooltipBehavior(
        enable: true,
        format: 'point.y',
      ),
      primaryXAxis: DateTimeAxis(
        // title: AxisTitle(text: 'Time'),
        interval: (1),
        intervalType: DateTimeIntervalType.hours,
        minimum: widget.pairsHourTokenModel.isNotEmpty
            ? widget.pairsHourTokenModel.first.time
            : null,
        maximum: widget.pairsHourTokenModel.isNotEmpty
            ? widget.pairsHourTokenModel.last.time
            : null,
      ),
      primaryYAxis: NumericAxis(
          // title: AxisTitle(text: 'Price'),
          ),
      series: [
        LineSeries<PairHourTokenModel, DateTime>(
          color: ColorConstants.primaryColor,
          dataSource: widget.pairsHourTokenModel,
          xValueMapper: (PairHourTokenModel sales, _) => sales.time,
          yValueMapper: (PairHourTokenModel sales, _) => sales.price,
          name: 'Price',
        )
      ],
    );
  }
}
