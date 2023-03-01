import 'package:cryptochart/viewmodel/graph_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uniswap Exchange Rate'),
      ),
      body: Center(
        child: FutureBuilder<double?>(
          future: getTokensTimestemp(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('ETH/USDT: \$${snapshot.data!.toStringAsFixed(2)}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
