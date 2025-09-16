import 'package:adietalk_radio/common/services/storage.dart';
import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    // Wait 2.5s, then fade out (duration 0.5s = total 3s)
    await Future.delayed(const Duration(milliseconds: 2500));
    setState(() {
      _opacity = 0.0;
    });

    // Wait for fade-out animation to finish, then navigate
    await Future.delayed(const Duration(milliseconds: 500));
    if (Storage().getBool('firstOpen') == null) {
      GoRouter.of(context).go('/onboarding');
    } else {
      GoRouter.of(context).go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: _opacity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Logo
              Image.asset(
                "assets/images/logo.png",
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(height: 24),

              /// Red Circular Progress Indicator
              const CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
