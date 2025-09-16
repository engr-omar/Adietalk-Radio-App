import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/utils/kstrings.dart';
import 'package:adietalk_radio/common/widgets/app_style.dart';
import 'package:adietalk_radio/common/widgets/custom_button.dart';
import 'package:adietalk_radio/common/widgets/reusable_text.dart';
import 'package:adietalk_radio/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kRadiusAll,
      child: Stack(
        children: [
          // ✅ Temporary Container instead of slider
          Container(
            height: ScreenUtil().screenHeight * 0.16,
            width: ScreenUtil().screenWidth,
            color: Kolors.kPrimaryLight.withOpacity(0.2),
            child: Center(),
          ),

          // ❌ Commented out: Image slider (for future use)
          /*
          SizedBox(
            height: ScreenUtil().screenHeight * 0.16,
            width: ScreenUtil().screenWidth,
            child: ImageSlideshow(
              indicatorColor: Kolors.kPrimaryLight,
              onPageChanged: (p) {},
              autoPlayInterval: 5000,
              isLoop: true,
              children: List.generate(images.length, (i) {
                return CachedNetworkImage(
                  placeholder: placeholder,
                  errorWidget: errorWidget,
                  imageUrl: images[i],
                  fit: BoxFit.cover,
                );
              }),
            ),
          ),
          */

          // Overlay content
          Positioned(
            child: SizedBox(
              height: ScreenUtil().screenHeight * 0.16,
              width: ScreenUtil().screenWidth,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: AppText.kCurrentShow,
                      style: appStyle(20, Kolors.kDark, FontWeight.w600),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Stay tuned for live shows, trending music, and exclusive moments!',
                      style: appStyle(
                        14,
                        Kolors.kDark.withOpacity(.6),
                        FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomButton(text: "Live Now", btnWidth: 120.w),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
