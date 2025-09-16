import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png", height: 250),
        const SizedBox(height: 40),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Tune In, Take Control",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Adietalk Radio puts you in the driver's seat of your audio experience. Discover new voices, curate your playlist, and enjoy seamless listening anytime, anywhere.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Kolors.kGray),
          ),
        ),
      ],
    );
  }
}
