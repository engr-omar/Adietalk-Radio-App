import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/utils/kstrings.dart';
import 'package:adietalk_radio/common/widgets/app_style.dart';
import 'package:adietalk_radio/common/widgets/back_button.dart';
import 'package:adietalk_radio/common/widgets/reusable_text.dart';
import 'package:adietalk_radio/const/constants.dart';
import 'package:adietalk_radio/src/categories/controllers/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: ReusableText(
          text: AppText.kCategories,
          style: appStyle(16, Kolors.kPrimary, FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, i) {
          final category = categories[i];
          return ListTile(
            onTap: () {
              // Go to category page
              context.read<CategoryNotifier>().setCategory(
                category.title,
                category.id,
              );
              context.push('/category');
            },
            leading: CircleAvatar(
              backgroundColor: Kolors.kSecondaryLight,
              radius: 18,
              child: _buildCategoryIcon(category),
            ),
            title: ReusableText(
              text: category.title,
              style: appStyle(12, Kolors.kDark, FontWeight.normal),
            ),
            trailing: const Icon(
              MaterialCommunityIcons.chevron_double_right,
              size: 18,
            ),
          );
        },
      ),
    );
  }

  /// Widget to display either an icon or image
  Widget _buildCategoryIcon(category) {
    if (category.icon != null) {
      return Icon(category.icon, size: 18.sp, color: Kolors.kPrimary);
    } else if (category.imageUrl != null && category.imageUrl!.isNotEmpty) {
      if (category.imageUrl!.endsWith(".svg")) {
        return SvgPicture.network(
          category.imageUrl!,
          width: 18.w,
          height: 18.h,
        );
      } else {
        return Image.network(
          category.imageUrl!,
          width: 18.w,
          height: 18.h,
          fit: BoxFit.contain,
        );
      }
    } else {
      return Icon(Icons.help_outline, size: 18.sp, color: Kolors.kGray);
    }
  }
}
