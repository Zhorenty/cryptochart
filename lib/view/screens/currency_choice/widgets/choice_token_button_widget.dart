import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/token.dart';
import '../../../../viewmodel/graph_provider.dart';

class TokenTile extends StatelessWidget {
  const TokenTile(
      {super.key, required this.tokenModel, required this.isFirstToken});

  final TokenModel tokenModel;
  final bool isFirstToken;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      onTap: () {
        isFirstToken
            ? context.read<PancakeSwapProvider>().changeToken1(tokenModel)
            : context.read<PancakeSwapProvider>().changeToken2(tokenModel);
        Navigator.pop(context);
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueGrey,
          radius: 16,
          child: Center(
            child: Text(tokenModel.name[0]),
          ),
        ),
        title: Text(
          tokenModel.name,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
