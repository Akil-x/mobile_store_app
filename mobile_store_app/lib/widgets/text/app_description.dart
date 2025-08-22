import 'package:flutter/material.dart';

class AppDescription extends StatelessWidget {
  const AppDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Text(
        'اكتشف منتجات رائعة وعروض لا تقاوم وتجربة تسوق سلسة',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.30,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w700,
          height: 1.90,
        ),
      ),
    );
  }
}
