import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  
  const GradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.04, 1.23),
          end: Alignment(-0.19, -0.04),
          colors: [
            Color(0xFF3E75FF),
            Color(0xFF1F53DC),
            Color(0xFF3E75FF),
            Color(0xFF1D4ED8)
          ],
        ),
      ),
      child: child,
    );
  }
}
