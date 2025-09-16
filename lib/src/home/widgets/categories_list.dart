import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/widgets/app_style.dart';
import 'package:adietalk_radio/common/widgets/reusable_text.dart';
import 'package:adietalk_radio/const/constants.dart';
import 'package:adietalk_radio/src/categories/controllers/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: SizedBox(
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(categories.length, (i) {
            final category = categories[i];
            return GestureDetector(
              onTap: () {
                context.read<CategoryNotifier>().setCategory(
                  category.title,
                  category.id,
                );
                context.push('/category');
              },
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 243, 229, 255),
                      child: Padding(
                        padding: EdgeInsets.all(4.h),
                        child: _buildCategoryIcon(category),
                      ),
                    ),
                    ReusableText(
                      text: category.title,
                      style: appStyle(12, Kolors.kGray, FontWeight.normal),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  /// Helper widget: shows either Icon or Image
  Widget _buildCategoryIcon(category) {
    if (category.icon != null) {
      return Icon(category.icon, size: 22.sp, color: Kolors.kPrimary);
    } else if (category.imageUrl != null && category.imageUrl!.isNotEmpty) {
      if (category.imageUrl!.endsWith(".svg")) {
        return SvgPicture.network(
          category.imageUrl!,
          width: 22.w,
          height: 22.h,
        );
      } else {
        return Image.network(
          category.imageUrl!,
          width: 22.w,
          height: 22.h,
          fit: BoxFit.contain,
        );
      }
    } else {
      return Icon(Icons.help_outline, size: 22.sp, color: Kolors.kGray);
    }
  }
}
