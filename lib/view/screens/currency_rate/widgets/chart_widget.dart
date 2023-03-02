import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PriceChart extends StatefulWidget {
  @override
  _PriceChartState createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> {
  List<PriceData> _priceData = [];

  @override
  void initState() {
    super.initState();
    // _fetchData();
  }

  List<PriceData> _parseData(String responseBody) {
    final lines = responseBody.split('\n');
    final format = DateFormat('yyyy-MM-dd HH:mm:ss');

    return lines.map((line) {
      final parts = line.split(',');
      final time = format.parse(parts[0]);
      final price = double.parse(parts[1]);
      return PriceData(time, price);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: DateTimeCategoryAxis(
        intervalType: DateTimeIntervalType.hours,
        interval: 1,
        rangePadding: ChartRangePadding.additional,
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        dateFormat: DateFormat.Hm(),
      ),
      series: <ChartSeries<PriceData, DateTime>>[
        LineSeries<PriceData, DateTime>(
          dataSource: _priceData,
          xValueMapper: (PriceData data, _) => data.time,
          yValueMapper: (PriceData data, _) => data.price,
        )
      ],
    );
  }
}

class PriceData {
  final DateTime time;
  final double price;

  PriceData(this.time, this.price);
}
