import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreShows extends StatelessWidget {
  const ExploreShows({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data with images
    final List<Map<String, String>> shows = [
      {
        "title": "Morning Vibes",
        "time": "6:00 AM - 10:00 AM",
        "image": "assets/images/shows.png",
      },
      {
        "title": "Midday Connect",
        "time": "10:00 AM - 2:00 PM",
        "image": "assets/images/shows.png",
      },
      {
        "title": "Drive Time Show",
        "time": "2:00 PM - 7:00 PM",
        "image": "assets/images/shows.png",
      },
      {
        "title": "Night Chill",
        "time": "7:00 PM - 11:59 PM",
        "image": "assets/images/shows.png",
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: StaggeredGrid.count(
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: 4,
        children: List.generate(shows.length, (i) {
          final show = shows[i];
          return StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1.5,
            child: Container(
              decoration: BoxDecoration(
                color: Kolors.kPrimaryLight,
                borderRadius: BorderRadius.circular(16.r),
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Show image
                  Expanded(
                    child: Image.asset(
                      show["image"]!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 8.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          show["title"]!,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Kolors.kOffWhite,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          show["time"]!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Kolors.kWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
