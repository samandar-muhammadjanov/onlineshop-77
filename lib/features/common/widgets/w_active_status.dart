import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';

class WActiveStatus extends StatelessWidget {
  const WActiveStatus({super.key, required this.date});
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.greenColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Активный",
            style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(3)),
            child: Text(
              "до $date",
              style: const TextStyle(
                  color: AppColors.orangeColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
