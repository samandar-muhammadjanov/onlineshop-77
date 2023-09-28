import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';

class WActiveStatus extends StatelessWidget {
  const WActiveStatus({super.key, required this.date});
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppConstants.kGreenColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Активный",
            style: TextStyle(
                color: AppConstants.kWhiteColor,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
                color: AppConstants.kWhiteColor,
                borderRadius: BorderRadius.circular(3)),
            child: Text(
              "до ${DateFormat("dd.MM.yyyy").format(date)}",
              style: const TextStyle(
                  color: AppConstants.kOrangeColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
