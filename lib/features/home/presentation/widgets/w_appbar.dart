// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_appbar_language_item.dart';

class WAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 92,
      centerTitle: true,
      leading: const WAppBarLanguageItem(),
      title: SvgPicture.asset(
        AppAssets.logo,
        width: 77,
      ),
      actions: [
        IconButton(
          onPressed: () async {},
          icon: SvgPicture.asset(AppAssets.bell),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 60);
}
