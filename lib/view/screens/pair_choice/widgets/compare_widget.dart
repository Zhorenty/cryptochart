import 'package:flutter/material.dart';

class CompareWidget extends StatelessWidget {
  const CompareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      width: 80,
      height: 70,
      child: const Icon(
        Icons.arrow_forward_ios,
        size: 30,
      ),
    );
  }
}
