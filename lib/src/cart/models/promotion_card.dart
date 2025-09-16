import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/widgets/app_style.dart';
import 'package:adietalk_radio/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/promotion_model.dart';

class PromotionCard extends StatelessWidget {
  final Promotion promotion;

  const PromotionCard({super.key, required this.promotion});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
            text: promotion.title,
            style: appStyle(14, Kolors.kPrimary, FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          ReusableText(
            text: promotion.description,
            style: appStyle(12, Kolors.kGray, FontWeight.normal),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableText(
                text: promotion.endsIn,
                style: appStyle(11, Kolors.kDark, FontWeight.w500),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Kolors.kPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  promotion.actionText,
                  style: appStyle(12, Colors.white, FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
