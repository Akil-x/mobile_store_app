import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/common/auth_header.dart';
import '../../widgets/common/auth_footer.dart';
import '../../widgets/forms/auth_card.dart';
import '../../widgets/forms/auth_text_field.dart';
import '../../widgets/buttons/auth_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Set full screen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    // Restore normal UI mode when leaving
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // TODO: Implement actual sign up logic
      print('Sign up with: ${_nameController.text}, ${_emailController.text}');
    }
  }

  void _handleLogin() {
    Navigator.of(context).pushNamed('/login');
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
              title: 'إنشاء حساب جديد',
              subtitle: 'أدخل بياناتك لإنشاء حساب جديد',
              actionText: 'تسجيل الدخول',
              onActionPressed: _handleLogin,
            ),

            // Main Content - Expanded to fill remaining space
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Sign Up Form
                    AuthCard(
                      title: 'تسجيل جديد',
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Name Field
                            AuthTextField(
                              labelText: 'الاسم الكامل',
                              hintText: 'أدخل اسمك الكامل',
                              controller: _nameController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجى إدخال الاسم الكامل';
                                }
                                if (value.length < 3) {
                                  return 'الاسم يجب أن يكون 3 أحرف على الأقل';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 16),

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

                            // Confirm Password Field
                            AuthTextField(
                              labelText: 'تأكيد كلمة المرور',
                              hintText: 'أعد إدخال كلمة المرور',
                              controller: _confirmPasswordController,
                              isPassword: true,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجى تأكيد كلمة المرور';
                                }
                                if (value != _passwordController.text) {
                                  return 'كلمة المرور غير متطابقة';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 24),

                            // Sign Up Button
                            AuthButton(
                              text: 'إنشاء حساب',
                              onPressed: _handleSignUp,
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

                            // Login Link
                            AuthFooter(
                              questionText: 'لديك حساب بالفعل؟',
                              actionText: 'تسجيل الدخول',
                              onActionPressed: _handleLogin,
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
