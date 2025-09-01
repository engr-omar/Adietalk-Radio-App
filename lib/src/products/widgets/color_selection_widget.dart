import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/widgets/app_style.dart';
import 'package:adietalk_radio/common/widgets/reusable_text.dart';
import 'package:adietalk_radio/const/constants.dart';
import 'package:adietalk_radio/src/products/controllers/colors_sizes_notifier.dart';
import 'package:adietalk_radio/src/products/controllers/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ColorSelectionWidget extends StatelessWidget {
  const ColorSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorSizesNotifier>(
      builder: (context, controller, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            context.read<ProductNotifier>().product!.colors.length,
            (i) {
              String c = context.read<ProductNotifier>().product!.colors[i];
              return GestureDetector(
                onTap: () {
                  controller.setColor(c);
                },
                child: Container(
                  padding: EdgeInsets.only(right: 20.w, left: 20.w),
                  margin: EdgeInsets.only(right: 20.w),
                  decoration: BoxDecoration(
                    borderRadius: kRadiusAll,
                    color: c == controller.color
                        ? Kolors.kPrimary
                        : Kolors.kGrayLight,
                  ),
                  child: ReusableText(
                    text: c,
                    style: appStyle(12, Kolors.kWhite, FontWeight.normal),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
