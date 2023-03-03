import 'package:cryptochart/view/screens/pair_choice/pair_choice_screen.dart';
import 'package:cryptochart/viewmodel/token_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

/*
К моему удивлению, используя uniswap api, некоторые пары токенов возвращают null, вот пары тех, которые работают.
WETH -> Все
USDC -> Все, кроме WETH
DAI -> WBTC, LINK, UNI 
WBTC -> UNI
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TokenProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PairChoiceScreen(),
      ),
    );
  }
}
