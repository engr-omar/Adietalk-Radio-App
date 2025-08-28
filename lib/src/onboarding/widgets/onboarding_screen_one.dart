import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/utils/kstrings.dart';
import 'package:adietalk_radio/common/widgets/app_style.dart';
import 'package:adietalk_radio/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          Image.asset(R.ASSETS_IMAGES_EXPERIENCE_PNG, fit: BoxFit.cover),
          Positioned(
            bottom: 180,
            left: 30,
            right: 30,
            child: Text(
              AppText.kWelcomeMessage,
              textAlign: TextAlign.center,
              style: appStyle(11, Kolors.kGray, FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
