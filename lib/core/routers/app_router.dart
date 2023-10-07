import 'package:flutter/material.dart';
import 'package:onlineshop_77/features/auth/presentation/login_screen.dart';
import 'package:onlineshop_77/features/auth/presentation/registration_screen.dart';
import 'package:onlineshop_77/features/auth/presentation/succes_register_screen.dart';
import 'package:onlineshop_77/features/categories/presentation/pages/seller_products_screen.dart';
import 'package:onlineshop_77/features/profile/presentation/pages/about_app_screen.dart';
import 'package:onlineshop_77/features/create_ads/presentation/pages/add_product_screen.dart';
import 'package:onlineshop_77/features/navigation/dashboard.dart';
import 'package:onlineshop_77/features/profile/presentation/pages/my_products_screen.dart';
import 'package:onlineshop_77/features/profile/presentation/pages/personal_information_screen.dart';
import 'package:onlineshop_77/features/profile/presentation/pages/privacy_policy_screen.dart';

class Routes {
  static const String dashboard = '/dashboard';
  static const String login = "/auth/login";
  static const String signIn = "/auth/signIn";
  static const String registerSuccess = "/auth/register/success";
  static const String personalInfo = "/personal-information";
  static const String addsMy = "/ads/my";
  static const String addPost = "/addpost";
  static const String privacyPolicy = "/privacy-policy";
  static const String aboutApp = "/aboutapp";
  static const String sellProducts = "/seller/products";

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    final Map<String, dynamic>? args = routeSettings.arguments as Map<String, dynamic>?;
    args ?? <String, dynamic>{};

    switch (routeSettings.name) {
      case dashboard:
        return MaterialPageRoute(
          builder: (context) => const Dashboard(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case signIn:
        return MaterialPageRoute(
          builder: (context) => const RegistrationScreen(),
        );
      case registerSuccess:
        return MaterialPageRoute(
          builder: (context) => const SuccessRegisterScreen(),
        );
      case personalInfo:
        return MaterialPageRoute(
          builder: (context) => const PersonalInformationScreen(),
        );
      case addsMy:
        return MaterialPageRoute(
          builder: (context) => const MyProductsScreen(),
        );
      case addPost:
        return MaterialPageRoute(
          builder: (context) => const AddProductScreen(),
        );
      case privacyPolicy:
        return MaterialPageRoute(
          builder: (context) => const PrivacyPolicyScreen(),
        );
      case aboutApp:
        return MaterialPageRoute(
          builder: (context) => const AboutAppScreen(),
        );
      case sellProducts:
        return MaterialPageRoute(
          builder: (context) => const SellerProductsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Dashboard(),
        );
    }
  }
}
