import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;
  
  const FeatureCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.27,
      height: 88,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(height: 8),
                      Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11.90,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
                height: 1.68,
              ),
            ),
        ],
      ),
    );
  }
}
