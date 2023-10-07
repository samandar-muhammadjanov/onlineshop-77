import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/common/widgets/w_custom_radio.dart';

class WFilterSelectItem extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final ValueChanged<String> onTap;
  const WFilterSelectItem(
      {required this.groupValue,
      required this.onTap,
      required this.title,
      required this.value,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      key: Key(title),
      onTap: () {
        onTap(value);
      },
      minLeadingWidth: 0,
      title: Text(
        title,
      ),
      leading: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.greyColor),
        ),
        child: groupValue != value ? const SizedBox() : const WCustomRadio(),
      ),
    );
  }
}
