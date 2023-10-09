import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';

extension LocalizationFlag on BuildContext {
  Widget localizedFlag(BuildContext context) {
    final currentLocale = context.locale;
    final flagAssetPath = _getFlagAssetPath(currentLocale);

    return SvgPicture.asset(
      flagAssetPath,
    );
  }

  String _getFlagAssetPath(Locale locale) {
    final languageCode = locale.languageCode;

    switch (languageCode) {
      case 'uz':
        return AppAssets.uz;
      case "ru":
        return AppAssets.ru;
      default:
        return AppAssets.ru;
    }
  }
}

extension NumberFormattingExtensions on num {
  String formatWithSpaces({String locale = 'en_US'}) {
    final numberFormat = NumberFormat.decimalPattern(locale);
    return numberFormat.format(this).replaceAll(',', ' ');
  }
}

extension PhoneNumberFormatting on String {
  String formatPhoneNumberWithSpaces() {
    String cleanedNumber = replaceAll(RegExp(r'[^\d]+'), '');
    if (cleanedNumber.length < 9) {
      return this; // Return the original string if it doesn't contain at least 9 digits.
    }
    return '+${cleanedNumber.substring(0, 3)} ${cleanedNumber.substring(3, 5)} ${cleanedNumber.substring(5, 8)} ${cleanedNumber.substring(8, 10)} ${cleanedNumber.substring(10, 12)}';
  }
}

extension FormattedDate on DateTime {
  String formatApiDate() {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    if (isAfter(now)) {
      final timeFormat = DateFormat('HH:mm');
      return timeFormat.format(this);
    } else if (isAfter(yesterday)) {
      return 'Вчера, ${DateFormat('HH:mm').format(this)}';
    } else {
      return '${DateFormat('MMMM d').format(this)}, ${DateFormat('HH:mm').format(this)}';
    }
  }
}

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  Size get sizeOf => MediaQuery.sizeOf(this);

  // CustomColors get themeExtension => theme.extension<CustomColors>()!;
  Brightness get brightness => theme.brightness;

  AppBarTheme get appBarTheme => theme.appBarTheme;

// Future<void> showPopUp({
//   required PopUpStatus status,
//   Widget? child,
//   double? height,
//   String? message,
//   Duration? displayDuration,
//   Duration? animationDuration,
//   Duration? reverseAnimationDuration,
//   DismissType? dismissType,
//   required BuildContext context,
// }) async {
//   AnimationController? localAnimationController;
//   showTopSnackBar(
//     Overlay.of(this),
//     child ??
//         Container(
//           height: height ?? 72,
//           decoration: BoxDecoration(
//             color: context.brightness == Brightness.light
//                 ? AppColors.white.withOpacity(.88)
//                 : AppColors.darkScaffoldColor,
//             border: Border.all(
//               color: context.theme.dividerColor,
//             ),
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: AppColors.darkGrey.withOpacity(.16),
//                 blurRadius: 20,
//                 offset: const Offset(0, 4),
//               )
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 2, sigmaY: 3, tileMode: TileMode.mirror),
//               child: Row(
//                 children: [
//                   SvgPicture.asset(
//                     AppIcons.indicator,
//                     color: statusColor(status),
//                   ),
//                   const SizedBox(width: 12),
//                   SvgPicture.asset(
//                     statusIcon(status),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       message ?? '',
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: Theme.of(this).textTheme.headlineLarge!.copyWith(
//                         color: context.theme.primaryColorDark,
//                       ),
//                     ),
//                   ),
//                   WScaleAnimation(
//                     onTap: () {
//                       if (localAnimationController != null) {
//                         localAnimationController!.reverse();
//                       }
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: SvgPicture.asset(
//                         AppIcons.closeProgress,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//     displayDuration: displayDuration ?? const Duration(milliseconds: 2100),
//     dismissDirection: [DismissDirection.vertical, DismissDirection.horizontal],
//     dismissType: dismissType ?? DismissType.onTap,
//     curve: Curves.easeIn,
//     reverseCurve: Curves.easeIn,
//     onAnimationControllerInit: (p0) => localAnimationController = p0,
//     animationDuration: animationDuration ?? const Duration(milliseconds: 400),
//     reverseAnimationDuration: reverseAnimationDuration ?? const Duration(milliseconds: 300),
//   );
// }
}

// enum PopUpStatus { success, error, warning }
//
// String statusIcon(PopUpStatus status) {
//   switch (status) {
//     case PopUpStatus.success:
//       return AppIcons.success;
//     case PopUpStatus.warning:
//       return AppIcons.warning;
//     case PopUpStatus.error:
//       return AppIcons.fail;
//   }
// }
//
// Color statusColor(PopUpStatus status) {
//   switch (status) {
//     case PopUpStatus.success:
//       return AppColors.success;
//     case PopUpStatus.error:
//       return AppColors.red;
//     case PopUpStatus.warning:
//       return AppColors.warning;
//   }
// }
