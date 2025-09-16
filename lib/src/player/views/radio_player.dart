import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/widgets/app_style.dart';
import 'package:adietalk_radio/common/widgets/back_button.dart';
import 'package:adietalk_radio/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class RadioPlayerScreen extends StatefulWidget {
  const RadioPlayerScreen({super.key});

  @override
  State<RadioPlayerScreen> createState() => _RadioPlayerScreenState();
}

class _RadioPlayerScreenState extends State<RadioPlayerScreen> {
  bool isPlaying = true;
  bool isLiked = false;
  double currentPosition = 2.35; // minutes
  double totalDuration = 3.45; // minutes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Kolors.kPrimary),
        title: ReusableText(
          text: "RADIO PLAYER",
          style: appStyle(18, Kolors.kPrimary, FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // ✅ Center contents
            children: [
              /// 🔼 Radio Name
              SizedBox(height: 12.h),

              /// 🎨 Show Image
              Padding(
                padding: EdgeInsets.all(20.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 200.h,
                    width: 200.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              /// 📋 Show Title + Host
              Text(
                "The Morning Show",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Kolors.kDark,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6.h),
              Text(
                "Hosted by Alex and Sarah",
                style: TextStyle(fontSize: 14.sp, color: Kolors.kDark),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20.h),

              /// 🔊 Audio Visualizer (Fake for UI only)
              Icon(Ionicons.pulse, color: Kolors.kPrimary, size: 40.sp),

              SizedBox(height: 20.h),

              /// 📍 Progress Bar
              Slider(
                activeColor: Kolors.kPrimary,
                inactiveColor: Kolors.kDark.withOpacity(0.3),
                value: currentPosition,
                min: 0,
                max: totalDuration,
                onChanged: (value) {
                  setState(() => currentPosition = value);
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "2:35",
                      style: TextStyle(color: Kolors.kDark, fontSize: 12.sp),
                    ),
                    Text(
                      "3:45",
                      style: TextStyle(color: Kolors.kDark, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              /// Playback Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      isPlaying ? Ionicons.pause_circle : Ionicons.play_circle,
                      size: 64.sp,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() => isPlaying = !isPlaying);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
