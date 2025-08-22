import 'package:flutter/material.dart';

class TextLinkButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final TextAlign textAlign;

  const TextLinkButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        padding: EdgeInsets.zero,
        textStyle: const TextStyle(
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w800,
          fontSize: 14,
        ),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          text,
          textAlign: textAlign,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}


