import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';

class WUnactiveStatus extends StatelessWidget {
  const WUnactiveStatus({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppConstants.kRedColor,
      ),
      child: const Text(
        "Отклонён",
        style: TextStyle(
            color: AppConstants.kWhiteColor,
            fontSize: 12,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
