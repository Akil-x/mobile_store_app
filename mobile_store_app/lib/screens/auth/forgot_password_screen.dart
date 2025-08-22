import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/common/auth_header.dart';
import '../../widgets/common/auth_footer.dart';
import '../../widgets/forms/auth_card.dart';
import '../../widgets/forms/auth_text_field.dart';
import '../../widgets/buttons/auth_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _isEmailSent = false;

  @override
  void initState() {
    super.initState();
    // Set full screen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    _emailController.dispose();
    // Restore normal UI mode when leaving
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  void _handleSendResetEmail() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
        _isEmailSent = true;
      });

      // TODO: Implement actual forgot password logic
      print('Send reset email to: ${_emailController.text}');
    }
  }

  void _handleBackToLogin() {
    Navigator.of(context).pop();
  }

  void _handleResendEmail() {
    setState(() {
      _isEmailSent = false;
    });
    _handleSendResetEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.32, 0.32),
            end: Alignment(1.32, 0.68),
            colors: [
              Color(0xFFEEF2FF), // color-grey-97
              Colors.white, // color-white-solid
              Color(0xFFEEF2FF), // color-grey-97
            ],
          ),
        ),
        child: Column(
          children: [
            // Header Section
            AuthHeader(
              title: _isEmailSent ? 'تحقق من بريدك' : 'استرداد كلمة المرور',
              subtitle: _isEmailSent
                  ? 'تم إرسال رابط إعادة تعيين كلمة المرور'
                  : 'أدخل بريدك الإلكتروني لاسترداد كلمة المرور',
              actionText: 'تسجيل الدخول',
              onActionPressed: _handleBackToLogin,
            ),

            // Main Content - Expanded to fill remaining space
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Reset Password Form or Success Message
                    AuthCard(
                      title:
                          _isEmailSent ? 'تم الإرسال' : 'استرداد كلمة المرور',
                      child: _isEmailSent
                          ? _buildSuccessContent()
                          : _buildResetForm(),
                    ),

                    // Bottom spacing
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResetForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Instruction Text
          const Text(
            'سنرسل لك رابط إعادة تعيين كلمة المرور على بريدك الإلكتروني',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF314157), // color-azure-27
              fontSize: 14,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          // Email Field
          AuthTextField(
            labelText: 'البريد الإلكتروني',
            hintText: 'أدخل بريدك الإلكتروني',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجى إدخال البريد الإلكتروني';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'يرجى إدخال بريد إلكتروني صحيح';
              }
              return null;
            },
          ),

          const SizedBox(height: 24),

          // Send Reset Email Button
          AuthButton(
            text: 'إرسال رابط الاسترداد',
            onPressed: _handleSendResetEmail,
            isLoading: _isLoading,
          ),

          const SizedBox(height: 24),

          // Divider
          Container(
            height: 1,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE1E8F0), // color-grey-91
                  width: 1.07,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Back to Login Link
          AuthFooter(
            questionText: 'تذكرت كلمة المرور؟',
            actionText: 'تسجيل الدخول',
            onActionPressed: _handleBackToLogin,
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessContent() {
    return Column(
      children: [
        // Success Icon
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFF4CAF50).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_circle_outline,
            size: 40,
            color: Color(0xFF4CAF50),
          ),
        ),

        const SizedBox(height: 24),

        // Success Message
        Text(
          'تم إرسال رابط إعادة تعيين كلمة المرور إلى:',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF314157), // color-azure-27
            fontSize: 14,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),

        const SizedBox(height: 8),

        // Email Address
        Text(
          _emailController.text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF155CFB), // color-azure-54
            fontSize: 16,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
            height: 1.5,
          ),
        ),

        const SizedBox(height: 24),

        // Instructions
        const Text(
          'تحقق من صندوق الوارد الخاص بك واتبع التعليمات لإعادة تعيين كلمة المرور.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF314157), // color-azure-27
            fontSize: 14,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),

        const SizedBox(height: 32),

        // Resend Email Button
        AuthButton(
          text: 'إعادة الإرسال',
          onPressed: _handleResendEmail,
        ),

        const SizedBox(height: 24),

        // Divider
        Container(
          height: 1,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFE1E8F0), // color-grey-91
                width: 1.07,
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Back to Login Link
        AuthFooter(
          questionText: 'العودة إلى',
          actionText: 'تسجيل الدخول',
          onActionPressed: _handleBackToLogin,
        ),
      ],
    );
  }
}
