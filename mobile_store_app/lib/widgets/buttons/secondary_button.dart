import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  
  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 332.80,
      height: 61.28,
      decoration: ShapeDecoration(
        color: Colors.black.withOpacity(0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white.withOpacity(0.30),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.30,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w800,
                height: 1.83,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
