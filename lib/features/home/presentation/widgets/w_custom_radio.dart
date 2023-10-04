import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';

class WCustomRadio extends StatelessWidget {
  const WCustomRadio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: AnimatedContainer(
        height: 25,
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                color: AppConstants.kPrimaryColor.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 10)
          ],
          border: Border.all(color: AppConstants.kPrimaryColor, width: 5.5),
        ),
      ),
    );
  }
}
