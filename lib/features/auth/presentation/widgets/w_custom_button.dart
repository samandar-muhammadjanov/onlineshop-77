// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';

class WCustomButton extends StatelessWidget {
  WCustomButton({
    Key? key,
    this.color = Colors.white,
    required this.text,
    required this.onPressed,
    this.hasBorder = false,
    this.isExpanded = false,
  }) : super(key: key);
  Color? color;
  String text;
  VoidCallback onPressed;
  bool hasBorder;
  bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return (isExpanded)
        ? Expanded(
            child: InkWell(
              customBorder: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              onTap: onPressed,
              child: Ink(
                height: 44,
                decoration: BoxDecoration(
                  color: (hasBorder) ? null : AppConstants.kPrimaryColor,
                  border: (hasBorder)
                      ? Border.all(color: AppConstants.kPrimaryColor)
                      : null,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 16,
                        color: hasBorder
                            ? AppConstants.kPrimaryColor
                            : AppConstants.kWhiteColor),
                  ),
                ),
              ),
            ),
          )
        : InkWell(
            customBorder: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            onTap: onPressed,
            child: Ink(
              height: 44,
              decoration: BoxDecoration(
                color: (hasBorder) ? null : AppConstants.kGreyColor,
                border: (hasBorder)
                    ? Border.all(color: AppConstants.kPrimaryColor)
                    : null,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: hasBorder
                          ? AppConstants.kPrimaryColor
                          : AppConstants.kBlackColor),
                ),
              ),
            ),
          );
  }
}
