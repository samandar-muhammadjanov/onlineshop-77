import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_custom_radio.dart';

class WSelectItem extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final ValueChanged<String> onTap;
  const WSelectItem(
      {required this.groupValue,
      required this.onTap,
      required this.title,
      required this.value,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key(title),
      onTap: () {
        onTap(value);
      },
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppConstants.kGreyColor),
        ),
        child: groupValue != value ? const SizedBox() : const WCustomRadio(),
      ),
    );
  }
}
