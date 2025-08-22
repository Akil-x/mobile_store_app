import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/common/auth_header.dart';
import '../../widgets/common/auth_footer.dart';
import '../../widgets/forms/auth_card.dart';
import '../../widgets/forms/auth_text_field.dart';
import '../../widgets/buttons/auth_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Set full screen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // Restore normal UI mode when leaving
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // TODO: Implement actual login logic
      print('Login with: ${_emailController.text}');
    }
  }

  void _handleForgotPassword() {
    Navigator.of(context).pushNamed('/forgot-password');
  }

  void _handleSignUp() {
    Navigator.of(context).pushNamed('/signup');
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
              title: 'أهلاً بعودتك',
              subtitle: 'سجل دخولك لحسابك للمتابعة',
              actionText: 'تسجيل جديد',
              onActionPressed: _handleSignUp,
            ),

            // Main Content - Expanded to fill remaining space
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Login Form
                    AuthCard(
                      title: 'تسجيل الدخول',
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Email Field
                            AuthTextField(
                              labelText: 'البريد الإلكتروني',
                              hintText: 'أدخل بريدك الإلكتروني',
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
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

                            const SizedBox(height: 16),

                            // Password Field
                            AuthTextField(
                              labelText: 'كلمة المرور',
                              hintText: 'أدخل كلمة المرور',
                              controller: _passwordController,
                              isPassword: true,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجى إدخال كلمة المرور';
                                }
                                if (value.length < 6) {
                                  return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 16),

                            // Forgot Password
                            Center(
                              child: TextButton(
                                onPressed: _handleForgotPassword,
                                child: const Text(
                                  'نسيت كلمة المرور؟',
                                  style: TextStyle(
                                    color: Color(0xFF155CFB), // color-azure-54
                                    fontSize: 14,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w500,
                                    height: 1.43,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            // Login Button
                            AuthButton(
                              text: 'تسجيل الدخول',
                              onPressed: _handleLogin,
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

                            // Sign Up Link
                            AuthFooter(
                              questionText: 'ليس لديك حساب؟',
                              actionText: 'سجل الآن',
                              onActionPressed: _handleSignUp,
                            ),
                          ],
                        ),
                      ),
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
}
