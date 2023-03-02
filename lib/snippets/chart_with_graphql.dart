// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Syncfusion Flutter Charts Demo',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late List<SalesData> chartData;

//   @override
//   void initState() {
//     super.initState();
//     chartData = <SalesData>[];
//     fetchChartData();
//   }

//   Future<void> fetchChartData() async {
//     final HttpLink httpLink = HttpLink(
//       uri: 'https://api.thegraph.com/subgraphs/name/uniswap/uniswap-v2',
//     );
//     final GraphQLClient client = GraphQLClient(
//       cache: GraphQLCache(),
//       link: httpLink,
//     );
//     final QueryOptions options = QueryOptions(
//       document: gql('''
//         query {
//           pairHourDatas(where: {
//             pair: "0xbb2b8038a1640196fbe3e38816f3e67cba72d940", hourStartUnix_gt: 1646121600 },
//             orderBy: hourStartUnix, orderDirection: asc,
//             first: 12) {
//             hourStartUnix
//             reserve0
//             reserve1
//           }
//         }
//       '''),
//     );
//     final QueryResult result = await client.query(options);
//     if (result.hasException) {
//       print(result.exception.toString());
//     } else {
//       final data = result.data!['pairHourDatas'];
//       for (int i = 0; i < data.length; i++) {
//         final hourStartUnix = DateTime.fromMillisecondsSinceEpoch(
//             data[i]['hourStartUnix'] * 1000);
//         final price = data[i]['reserve1'] / data[i]['reserve0'];
//         chartData.add(SalesData(hourStartUnix, price));
//       }
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Syncfusion Flutter Charts Demo'),
//       ),
//       body: SfCartesianChart(
//         primaryXAxis: DateTimeAxis(
//           interval: const Hour(1),
//           minimum: chartData.isNotEmpty ? chartData.first.yearMonthDay : null,
//           maximum: chartData.isNotEmpty ? chartData.last.yearMonthDay : null,
//         ),
//         primaryYAxis: NumericAxis(
//           title: AxisTitle(text: 'Price'),
//         ),
//         series: <LineSeries<SalesData, DateTime>>[
//           LineSeries<SalesData, DateTime>(
//             dataSource: chartData,
//             xValueMapper: (SalesData sales, _) => sales.yearMonthDay,
//             yValueMapper: (SalesData sales, _) => sales.sales,
//             name: 'Price',
//           )
//         ],
//       ),
//     );
//   }
// }

// class SalesData {
//   SalesData(this.yearMonthDay, this.sales);
//   final DateTime yearMonthDay;
//   final double sales;
// }
