import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  final String questionText;
  final String actionText;
  final VoidCallback onActionPressed;

  const AuthFooter({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: onActionPressed,
            child: Text(
              actionText,
              style: const TextStyle(
                color: Color(0xFF1347E5), // color-blue-49
                fontSize: 14,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
                height: 1.43,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            questionText,
            style: const TextStyle(
              color: Color(0xFF314157), // color-azure-27
              fontSize: 14,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w500,
              height: 1.43,
            ),
          ),
        ],
      ),
    );
  }
}
