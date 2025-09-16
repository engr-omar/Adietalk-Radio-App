import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/widgets/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget({
    super.key,
    required this.title,
    this.onTap,
    required this.leading,
  });

  final String title;
  final void Function()? onTap;
  final IconData leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      onTap: onTap,
      leading: Icon(leading, color: Kolors.kPrimary),
      title: Text(title, style: appStyle(16, Kolors.kDark, FontWeight.normal)),
      trailing: const Icon(AntDesign.right, size: 16, color: Kolors.kDark),
    );
  }
}
