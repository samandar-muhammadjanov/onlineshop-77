import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class ShowPhoneNumber extends StatefulWidget {
  const ShowPhoneNumber({
    super.key,
    required this.phoneNumber,
  });
  final String phoneNumber;

  @override
  State<ShowPhoneNumber> createState() => _ShowPhoneNumberState();
}

class _ShowPhoneNumberState extends State<ShowPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.phoneNumber.formatPhoneNumberWithSpaces(),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
                color: AppConstants.kBackgroundColor,
                borderRadius: BorderRadius.circular(6)),
            child: Text(
              LocaleKeys.allPosts.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
