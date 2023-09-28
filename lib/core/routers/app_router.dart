import 'package:flutter/material.dart';
import 'package:onlineshop_77/features/auth/presentation/login_screen.dart';
import 'package:onlineshop_77/features/auth/presentation/registration_screen.dart';
import 'package:onlineshop_77/features/auth/presentation/succes_register_screen.dart';
import 'package:onlineshop_77/features/home/presentation/add_product_screen.dart';
import 'package:onlineshop_77/features/home/presentation/dashboard.dart';
import 'package:onlineshop_77/features/home/presentation/my_products_screen.dart';
import 'package:onlineshop_77/features/home/presentation/personal_information_screen.dart';
import 'package:onlineshop_77/features/home/presentation/settings_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Dashboard.routeName:
        return MaterialPageRoute(
          builder: (context) => const Dashboard(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RegistrationScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const RegistrationScreen(),
        );
      case SettingsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        );
      case SuccessRegisterScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SuccessRegisterScreen(),
        );
      case PersonalInformationScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const PersonalInformationScreen(),
        );
      case MyProductsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const MyProductsScreen(),
        );
      case AddProductScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddProductScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Dashboard(),
        );
    }
  }
}
