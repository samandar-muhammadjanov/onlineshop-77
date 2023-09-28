import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';

import '../../features/auth/presentation/widgets/w_forgot_password_modalpopup.dart';

class AppSingleton {
  static void showForgotPassword(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppConstants.kTransparent,
      context: context,
      builder: (context) => const ForgotPasswordModalPopup(),
    );
  }
}
