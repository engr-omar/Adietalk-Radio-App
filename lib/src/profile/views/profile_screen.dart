import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/widgets/app_style.dart';
import 'package:adietalk_radio/common/widgets/back_button.dart';
import 'package:adietalk_radio/common/widgets/help_bottom_sheet.dart';
import 'package:adietalk_radio/common/widgets/reusable_text.dart';
import 'package:adietalk_radio/src/profile/widget/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
          text: "Settings",
          style: appStyle(18, Kolors.kPrimary, FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        children: [
          Container(
            color: Kolors.kOffWhite,
            child: Column(
              children: [
                ProfileTileWidget(
                  title: 'My Playlists',
                  leading: Icons.library_music,
                  onTap: () => context.push('/orders'),
                ),
                ProfileTileWidget(
                  title: 'Recently Played',
                  leading: Icons.history,
                  onTap: () => context.push('/orders'),
                ),
                ProfileTileWidget(
                  title: 'Favorites',
                  leading: Icons.favorite,
                  onTap: () => context.push('/addresses'),
                ),
                ProfileTileWidget(
                  title: 'Privacy Policy',
                  leading: Icons.privacy_tip,
                  onTap: () => context.push('/policy'),
                ),
                ProfileTileWidget(
                  title: 'Help & Support',
                  leading: Icons.headset_mic,
                  onTap: () => showHelpCenterBottomSheet(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
