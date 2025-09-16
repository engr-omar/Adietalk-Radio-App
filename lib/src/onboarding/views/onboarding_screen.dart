import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:adietalk_radio/src/onboarding/widgets/onboarding_page_one.dart';
import 'package:adietalk_radio/src/onboarding/widgets/onboarding_page_two.dart';
import 'package:adietalk_radio/src/onboarding/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return ChangeNotifierProvider(
      create: (_) => OnboardingNotifier(),
      child: Consumer<OnboardingNotifier>(
        builder: (context, notifier, _) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  // Skip button
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () => context.go('/home'),
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Kolors.kPrimary),
                      ),
                    ),
                  ),

                  // PageView for screens
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        notifier.setSelectedPage = index;
                      },
                      children: const [
                        OnboardingScreenOne(),
                        OnboardingScreenTwo(),
                        WelcomeScreen(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Page indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: notifier.selectedPage == index ? 12 : 8,
                        height: notifier.selectedPage == index ? 12 : 8,
                        decoration: BoxDecoration(
                          color: notifier.selectedPage == index
                              ? Kolors.kPrimary
                              : Colors.grey.shade400,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 30),

                  // Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Kolors.kPrimary,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      if (notifier.selectedPage < 2) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        context.go('/home');
                      }
                    },
                    child: Text(
                      notifier.selectedPage < 2 ? "Next" : "Get Started",
                      style: TextStyle(
                        color: Kolors.kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
