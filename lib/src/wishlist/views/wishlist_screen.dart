import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/widgets/app_style.dart';
import 'package:adietalk_radio/common/widgets/back_button.dart';
import 'package:adietalk_radio/common/widgets/reusable_text.dart';
import 'package:adietalk_radio/src/home/widgets/shows_widget.dart';
import 'package:flutter/material.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

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
          text: "Shows", // 👈 Changed here to match screenshot
          style: appStyle(18, Kolors.kPrimary, FontWeight.bold),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ExploreShows(), // your shows grid
          ],
        ),
      ),
    );
  }
}
