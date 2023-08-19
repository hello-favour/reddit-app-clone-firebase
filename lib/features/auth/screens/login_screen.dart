import 'package:flutter/material.dart';
import 'package:reddit_app_clone/components/sign_in_button.dart';
import 'package:reddit_app_clone/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          Constant.logoPath,
          height: 40,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Skip",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text(
            "Dive into anything",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Constant.loginEmotePath,
              height: 400,
            ),
          ),
          const SizedBox(height: 25),
          const SignInButton(),
        ],
      ),
    );
  }
}
