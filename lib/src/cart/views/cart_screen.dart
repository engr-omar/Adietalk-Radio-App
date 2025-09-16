import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/widgets/app_style.dart';
import 'package:adietalk_radio/common/widgets/back_button.dart';
import 'package:adietalk_radio/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromotionsScreen extends StatelessWidget {
  const PromotionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final promotions = [
      {
        "title": "Exclusive Interview with Dr. Emily Carter",
        "description":
            "Tune in for a live Q&A with renowned nutritionist Dr. Emily Carter, discussing the latest in dietary science.",
        "endsIn": "Ends in 3 days",
        "buttonText": "Listen Now",
      },
      {
        "title": "Summer Slimdown Challenge",
        "description":
            "Join our 4-week challenge to kickstart your summer fitness goals with expert guidance and community support.",
        "endsIn": "Ends in 7 days",
        "buttonText": "Join Now",
      },
      {
        "title": "Healthy Eating Workshop",
        "description":
            "Attend our virtual workshop to learn practical tips for meal planning and healthy eating habits.",
        "endsIn": "Ends in 14 days",
        "buttonText": "Register",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Kolors.kPrimary),
        title: ReusableText(
          text: "Promotion", // 👈 Changed here to match screenshot
          style: appStyle(18, Kolors.kPrimary, FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12.w),
        itemCount: promotions.length,
        itemBuilder: (context, index) {
          final promo = promotions[index];
          return PromotionCard(
            title: promo["title"]!,
            description: promo["description"]!,
            endsIn: promo["endsIn"]!,
            buttonText: promo["buttonText"]!,
            onPressed: () {
              // Handle button action here
            },
          );
        },
      ),
    );
  }
}

class PromotionCard extends StatelessWidget {
  final String title;
  final String description;
  final String endsIn;
  final String buttonText;
  final VoidCallback onPressed;

  const PromotionCard({
    super.key,
    required this.title,
    required this.description,
    required this.endsIn,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
            text: title,
            style: appStyle(16, Colors.black, FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: appStyle(12, Colors.black87, FontWeight.normal),
          ),
          SizedBox(height: 12.h),
          Text(
            endsIn,
            style: appStyle(13, Colors.grey.shade700, FontWeight.w500),
          ),
          SizedBox(height: 12.h),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              ),
              onPressed: onPressed,
              child: Text(
                buttonText,
                style: appStyle(14, Colors.white, FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:adietalk_radio/common/utils/kcolors.dart';
// import 'package:adietalk_radio/common/widgets/app_style.dart';
// import 'package:adietalk_radio/common/widgets/reusable_text.dart';
// import 'package:adietalk_radio/src/cart/controller/promotion_data.dart';
// import 'package:adietalk_radio/src/cart/models/promotion_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class PromotionsScreen extends StatelessWidget {
//   const PromotionsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: ReusableText(
//             text: "Promotions",
//             style: appStyle(16, Kolors.kPrimary, FontWeight.bold),
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.all(12.w),
//         itemCount: promotions.length,
//         itemBuilder: (context, index) {
//           return PromotionCard(promotion: promotions[index]);
//         },
//       ),
//     );
//   }
// }
