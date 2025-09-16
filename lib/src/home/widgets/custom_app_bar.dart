import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/widgets/app_style.dart';
import 'package:adietalk_radio/common/widgets/reusable_text.dart';
import 'package:adietalk_radio/src/home/widgets/live_stream_button.dart';
import 'package:adietalk_radio/src/home/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () {
          context.push('/player');
        },
        child: Row(
          children: [
            const Icon(Ionicons.mic, size: 20, color: Kolors.kGreen),
            SizedBox(width: 8.w),
            Text(
              "Live Now",
              style: appStyle(14, Kolors.kPrimary, FontWeight.w600),
            ),
          ],
        ),
      ),
      actions: const [NotificationWidget()],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: GestureDetector(
          onTap: () {
            context.push('/search');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Container(
                    height: 40.h,
                    width: ScreenUtil().screenWidth - 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Kolors.kPrimaryLight.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Ionicons.search,
                            size: 20,
                            color: Kolors.kGray,
                          ),
                          SizedBox(width: 20.w),
                          ReusableText(
                            text: "Search Shows",
                            style: appStyle(14, Kolors.kGray, FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const LiveStreamButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
