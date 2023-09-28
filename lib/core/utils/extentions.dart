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
    return '+${cleanedNumber.substring(0, 3)} ${cleanedNumber.substring(3, 5)} ${cleanedNumber.substring(5, 8)} ${cleanedNumber.substring(8)}';
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
