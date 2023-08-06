import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/constants/colors.dart';
import '/model/token.dart';
import '/viewmodel/token_provider.dart';

/// TODO: docs
class TokenTile extends StatelessWidget {
  const TokenTile({
    super.key,
    required this.tokenModel,
    required this.isFirstToken,
  });

  /// TODO: docs
  final TokenModel tokenModel;

  /// TODO: docs
  final bool isFirstToken;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      onTap: () {
        isFirstToken
            ? context.read<TokenProvider>().changeToken1(tokenModel)
            : context.read<TokenProvider>().changeToken2(tokenModel);
        Navigator.pop(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: ColorConstants.primary,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: ColorConstants.secondary,
            radius: 16,
            child: Center(child: Text(tokenModel.name[0])),
          ),
          title: Text(
            tokenModel.name,
            style: const TextStyle(
              color: ColorConstants.secondary,
              fontSize: 23,
              fontFamily: 'Outfit',
            ),
          ),
        ),
      ),
    );
  }
}
