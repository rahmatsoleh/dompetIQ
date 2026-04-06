import 'package:dompet_iq/theme_app.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  static const String routeName = "onboarding";

  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [pinkMist, petalFrost],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/money.png", width: double.infinity),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome", style: robotoSemibold32),
                    SizedBox(height: 32),
                    Text(
                      "Start taking control of your finances today. Record, undserstand, and manage every expense so you can live a more peaceful and purposeful life.",
                      style: poppinsRegular14,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: petalRouge,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Get Started",
                          style: poppinsRegluar16.copyWith(color: whiteColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
