import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/presentation/categories_screen.dart';
import 'package:onlineshop_77/features/home/presentation/favorites_screen.dart';
import 'package:onlineshop_77/features/home/presentation/home_screen.dart';
import 'package:onlineshop_77/features/home/presentation/profile_screen.dart';
import 'package:onlineshop_77/features/home/presentation/search_screen.dart';
import 'package:onlineshop_77/features/home/data/repositories/data_repository.dart';
import '../../../generated/locale_keys.g.dart';
import 'widgets/w_appbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const String routeName = '/dashboard';

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
    ProfileScreen()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeRepository.getProducts("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentScreen == 4 ? null : const WAppBar(),
      body: screens[currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreen,
        selectedItemColor: AppConstants.kBlackColor,
        selectedLabelStyle: const TextStyle(
          color: AppConstants.kBlackColor,
          fontWeight: FontWeight.w600,
        ),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        unselectedItemColor: AppConstants.kBlackColor,
        onTap: (int screen) {
          currentScreen = screen;
          setState(() {});
        },
        elevation: 40,
        backgroundColor: AppConstants.kWhiteColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.home,
                color: currentScreen == 0
                    ? AppConstants.kPrimaryColor
                    : AppConstants.kDarkGreyColor,
              ),
              label: LocaleKeys.main.tr()),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.search,
                color: currentScreen == 1
                    ? AppConstants.kPrimaryColor
                    : AppConstants.kDarkGreyColor,
              ),
              label: LocaleKeys.search.tr()),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.list,
                color: currentScreen == 2
                    ? AppConstants.kPrimaryColor
                    : AppConstants.kDarkGreyColor,
              ),
              label: LocaleKeys.category.tr()),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.heart,
                color: currentScreen == 3
                    ? AppConstants.kPrimaryColor
                    : AppConstants.kDarkGreyColor,
              ),
              label: LocaleKeys.favorites.tr()),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.user,
                color: currentScreen == 4
                    ? AppConstants.kPrimaryColor
                    : AppConstants.kDarkGreyColor,
              ),
              label: LocaleKeys.profile.tr()),
        ],
      ),
    );
  }
}
