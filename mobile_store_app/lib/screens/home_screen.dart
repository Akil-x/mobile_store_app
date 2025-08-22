import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/common/gradient_background.dart';
import '../widgets/text/app_title.dart';
import '../widgets/text/app_description.dart';
import '../widgets/cards/feature_card.dart';
import '../widgets/buttons/primary_button.dart';
import '../widgets/buttons/secondary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // App Logo - centered at top
              const SizedBox(height: 80),

              // Main Content with shadow box
              const SizedBox(height: 40),
              Container(
                width: 96,
                height: 96,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 15,
                      offset: Offset(0, 10),
                      spreadRadius: -3,
                    ),
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 6,
                      offset: Offset(0, 4),
                      spreadRadius: -4,
                    )
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/box-large.svg',
                    width: 48,
                    height: 48,
                  ),
                ),
              ),

              // App Title and Description
              const SizedBox(height: 40),
              const AppTitle(),

              const SizedBox(height: 16),
              const AppDescription(),

              // Feature Cards
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const FeatureCard(
                    title: 'الاكثر رواج',
                    icon: Icons.trending_up,
                  ),
                  const FeatureCard(
                    title: 'مميز',
                    icon: Icons.star,
                  ),
                  const FeatureCard(
                    title: 'منتجات',
                    icon: Icons.shopping_bag,
                  ),
                ],
              ),

              // Action Buttons
              const SizedBox(height: 40),
              PrimaryButton(
                text: 'ابدأ الآن',
                onPressed: () {
                  Navigator.of(context).pushNamed('/signup');
                },
              ),
              const SizedBox(height: 12),
              SecondaryButton(
                text: 'لدي حساب بالفعل',
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
              ),

              // Bottom spacing
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
