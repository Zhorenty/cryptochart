import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '/viewmodel/token_provider.dart';
import '/core/constants/colors.dart';
import '/model/pair_hour_token.dart';

/// TODO: docs
class PriceChart extends StatefulWidget {
  const PriceChart({
    super.key,
    required this.pairsHourTokenModel,
  });

  /// TODO: docs
  final List<PairHourTokenModel> pairsHourTokenModel;

  @override
  State<PriceChart> createState() => _PriceChartState();
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
        interval: (1),
        intervalType: DateTimeIntervalType.days,
        minimum: widget.pairsHourTokenModel.isNotEmpty
            ? widget.pairsHourTokenModel.first.time
            : null,
        maximum: widget.pairsHourTokenModel.isNotEmpty
            ? widget.pairsHourTokenModel.last.time
            : null,
      ),
      primaryYAxis: NumericAxis(),
      series: [
        LineSeries<PairHourTokenModel, DateTime>(
          color: ColorConstants.primary,
          dataSource: widget.pairsHourTokenModel,
          xValueMapper: (PairHourTokenModel sales, _) => sales.time,
          yValueMapper: (PairHourTokenModel sales, _) => sales.price,
          name: 'Price',
        )
      ],
    );
  }
}
