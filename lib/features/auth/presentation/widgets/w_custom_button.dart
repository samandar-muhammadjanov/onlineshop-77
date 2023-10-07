// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
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
                  color: (hasBorder) ? null : AppColors.primaryColor,
                  border: (hasBorder)
                      ? Border.all(color: AppColors.primaryColor)
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
                            ? AppColors.primaryColor
                            : AppColors.whiteColor),
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
                color: (hasBorder) ? null : AppColors.greyColor,
                border: (hasBorder)
                    ? Border.all(color: AppColors.primaryColor)
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
                          ? AppColors.primaryColor
                          : AppColors.blackColor),
                ),
              ),
            ),
          );
  }
}
