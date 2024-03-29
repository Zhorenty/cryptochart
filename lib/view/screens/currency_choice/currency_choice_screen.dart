import 'package:flutter/material.dart';

import '/core/constants/colors.dart';
import '/core/constants/tokens.dart';
import 'widgets/choice_token_button_widget.dart';

/// TODO: docs
class CurrencyChoiceScreen extends StatelessWidget {
  const CurrencyChoiceScreen({super.key, this.isFirstToken = false});

  /// TODO: docs
  final bool isFirstToken;

  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = Tokens.allTokens.map((token) {
      return TokenTile(
        tokenModel: token,
        isFirstToken: isFirstToken,
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Currency Choice',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontFamily: 'Outfit',
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 27,
            color: ColorConstants.background,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (context, index) => tiles[index],
          itemCount: tiles.length,
          separatorBuilder: (context, _) => const SizedBox(height: 10),
        ),
      ),
    );
  }
}
