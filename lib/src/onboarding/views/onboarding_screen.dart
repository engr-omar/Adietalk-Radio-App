import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:adietalk_radio/src/onboarding/widgets/onboarding_screen_one.dart';
import 'package:adietalk_radio/src/onboarding/widgets/onboarding_screen_two.dart';
import 'package:adietalk_radio/src/onboarding/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: context.read<OnboardingNotifier>().selectedPage,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<OnboardingNotifier>(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (page) {
              context.read<OnboardingNotifier>().setSelectedPage = page;
            },
            children: const [
              OnboardingScreenOne(),
              OnboardingScreenTwo(),
              WelcomeScreen(),
            ],
          ),
          Positioned(
            bottom: 58.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: ScreenUtil().screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Icon(AntDesign.leftcircleo, color: Kolors.kPrimary, size: 30),

                  SizedBox(
                    width: ScreenUtil().screenWidth * 0.7,
                    height: 50.h,
                    child: PageViewDotIndicator(
                      currentItem: context
                          .watch<OnboardingNotifier>()
                          .selectedPage,
                      count: 3,
                      unselectedColor: Colors.black26,
                      selectedColor: Kolors.kPrimary,
                      duration: Duration(microseconds: 200),
                      onItemClicked: (index) {
                        _pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                      },
                    ),
                  ),
                  Icon(
                    AntDesign.rightcircleo,
                    color: Kolors.kPrimary,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
