import 'package:adietalk_radio/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<OnboardingNotifier>(context);
    return Scaffold(
      body: Consumer<OnboardingNotifier>(
        builder: (context, onboardingNotifier, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  pro.setSelectedPage = 9;
                },
                child: Text('Increament'),
              ),
              Text(onboardingNotifier.selectedPage.toString()),
            ],
          );
        },
      ),
    );
  }
}
