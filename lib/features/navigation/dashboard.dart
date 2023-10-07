import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/categories/presentation/pages/categories_screen.dart';
import 'package:onlineshop_77/features/common/widgets/w_appbar.dart';
import 'package:onlineshop_77/features/favorites/presentation/pages/favorites_screen.dart';
import 'package:onlineshop_77/features/home/presentation/home_screen.dart';
import 'package:onlineshop_77/features/profile/presentation/pages/profile_screen.dart';
import 'package:onlineshop_77/features/search/presentation/widgets/search_screen.dart';
import '../../generated/locale_keys.g.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentScreen = 0;
  List screens = const [
    HomeScreen(),
    SearchScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];
  final List<Map<String, dynamic>> _bottomNavBarItems = [
    {"icon": AppAssets.home, "label": LocaleKeys.main.tr()},
    {"icon": AppAssets.search, "label": LocaleKeys.search.tr()},
    {"icon": AppAssets.list, "label": LocaleKeys.category.tr()},
    {"icon": AppAssets.heart, "label": LocaleKeys.favorites.tr()},
    {"icon": AppAssets.user, "label": LocaleKeys.profile.tr()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentScreen == 4 ? null : const WAppBar(),
      body: Stack(
        children: [
          screens[currentScreen],
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  color: AppColors.whiteColor.withOpacity(0.7),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(_bottomNavBarItems.length, (index) {
                      final item = _bottomNavBarItems[index];
                      return GestureDetector(
                        onTap: () {
                          currentScreen = index;
                          setState(() {});
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.transparent,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              SvgPicture.asset(
                                item["icon"],
                                color: currentScreen == index ? AppColors.primaryColor : AppColors.darkGreyColor,
                              ),
                              const Spacer(),
                              Text(
                                item["label"],
                                style: TextStyle(
                                    fontSize: 11,
                                    color: currentScreen == index ? AppColors.blackColor : AppColors.darkGreyColor,
                                    fontWeight: currentScreen == index ? FontWeight.w700 : FontWeight.w500),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
