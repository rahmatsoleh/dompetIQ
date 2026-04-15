import 'package:dompet_iq/pages/screens/main_screen.dart';
import 'package:dompet_iq/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "login";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/wallet.png", width: 300),
              SizedBox(height: 40),
              Text("Sign In", style: robotoSemibold42),
              SizedBox(height: 16),
              Text(
                "Use account to integrate online access.",
                style: poppinsRegular14,
              ),
              SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/google.png",
                  width: 24,
                  height: 24,
                ),
                label: Text(
                  "Sign in with Google",
                  style: poppinsMedium16.copyWith(color: whiteColor),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: petalRouge,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 4,
                ),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  context.goNamed(MainScreen.routeName);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 12,
                  ),
                  side: BorderSide(color: greyText, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text("Guest Mode", style: poppinsRegular16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
