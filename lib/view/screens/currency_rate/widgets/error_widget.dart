import 'package:cryptochart/core/constants/colors.dart';
import 'package:flutter/material.dart';

/// TODO: docs
class MistakeWidget extends StatelessWidget {
  const MistakeWidget({super.key, this.message});

  /// TODO: docs
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: ColorConstants.primary,
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
              color: ColorConstants.secondary,
              size: 35,
            ),
            const SizedBox(width: 18),
            if (message != null)
              Text(
                message!,
                style: const TextStyle(
                  color: ColorConstants.secondary,
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
