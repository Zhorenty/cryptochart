// class _MyAppState extends State<MyApp> {
//   List<PriceData> _priceData = [];

//   @override
//   void initState() {
//     super.initState();
//     _getData();
//     Timer.periodic(Duration(hours: 1), (Timer t) => _getData());
//   }

//   Future<void> _getData() async {
//     final response = await http.get(Uri.parse(
//         'https://api.thegraph.com/subgraphs/name/uniswap/uniswap-v2?query={pair: pair(id: "0xbb2b8038a1640196fbe3e38816f3e67cba72d940") {token0 {symbol} token1 {symbol derivedETH}}}'));
//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       final wethPrice =
//           double.parse(jsonResponse['data']['pair']['token0']['derivedETH']);
//       final wbtcPrice =
//           double.parse(jsonResponse['data']['pair']['token1']['derivedETH']);
//       final dateTime = DateTime.now();
//       final priceData = PriceData(dateTime, wethPrice, wbtcPrice);
//       setState(() {
//         _priceData.add(priceData);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: SfCartesianChart(
//             primaryXAxis: DateTimeCategoryAxis(
//               intervalType: DateTimeIntervalType.hours,
//               interval: 1,
//               rangePadding: ChartRangePadding.additional,
//               edgeLabelPlacement: EdgeLabelPlacement.shift,
//               dateFormat: DateFormat.Hm(),
//             ),
//             primaryYAxis: NumericAxis(
//               labelFormat: '\${value}',
//             ),
//             series: <ChartSeries>[
//               LineSeries<PriceData, String>(
//                 dataSource: _priceData,
//                 xValueMapper: (PriceData data, _) =>
//                     DateFormat.Hm().format(data.time),
//                 yValueMapper: (PriceData data, _) => data.wethPrice,
//                 name: 'WETH',
//               ),
//               LineSeries<PriceData, String>(
//                 dataSource: _priceData,
//                 xValueMapper: (PriceData data, _) =>
//                     DateFormat.Hm().format(data.time),
//                 yValueMapper: (PriceData data, _) => data.wbtcPrice,
//                 name: 'WBTC',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PriceData {
//   final DateTime time;
//   final double wethPrice;
//   final double wbtcPrice;

//   PriceData(this.time, this.wethPrice, this.wbtcPrice);
// }
