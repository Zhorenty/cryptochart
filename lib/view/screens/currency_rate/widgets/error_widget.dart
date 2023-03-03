// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cryptochart/core/constants/colors.dart';
import 'package:flutter/material.dart';

class MistakeWidget extends StatelessWidget {
  final String message;

  const MistakeWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: ColorConstants.primaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: ColorConstants.secondaryWhiteColor,
              size: 35,
            ),
            const SizedBox(width: 18),
            Text(
              message,
              style: const TextStyle(
                color: ColorConstants.secondaryWhiteColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
