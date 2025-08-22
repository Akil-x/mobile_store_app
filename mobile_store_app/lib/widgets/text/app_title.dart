import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Text(
        'متجر كنز',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.60,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w900,
          height: 1.31,
        ),
      ),
    );
  }
}
