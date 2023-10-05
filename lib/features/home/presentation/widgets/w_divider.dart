import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';

class WDivider extends StatelessWidget {
  const WDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppConstants.kBorderColor,
      height: 0,
    );
  }
}
