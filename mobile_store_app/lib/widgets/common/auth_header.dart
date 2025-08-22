import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onBackPressed;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.onBackPressed,
    this.actionText,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 24,
        left: 24,
        right: 24,
        bottom: 24,
      ),
      child: Column(
        children: [
          // Top Row with Back Button and Action Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back Button
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFE1E8F0), // color-grey-91
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 20),
                  onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                  color: const Color(0xFF0E162B), // color-azure-11
                ),
              ),

              // Action Button (optional)
              if (actionText != null)
                GestureDetector(
                  onTap: onActionPressed,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFBDDAFF), // color-azure-87
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      actionText!,
                      style: const TextStyle(
                        color: Color(0xFF155CFB), // color-azure-54
                        fontSize: 14,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        height: 1.43,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 32),

          // Welcome Text
          Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF0E162B), // color-azure-11
                  fontSize: 36,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w900,
                  height: 1.20,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF314157), // color-azure-27
                  fontSize: 16,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w500,
                  height: 1.60,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
