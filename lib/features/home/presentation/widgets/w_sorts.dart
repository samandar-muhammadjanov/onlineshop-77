import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_filter_select_item.dart';

class WSorts extends StatefulWidget {
  const WSorts({
    super.key,
  });

  @override
  State<WSorts> createState() => _WSortsState();
}

class _WSortsState extends State<WSorts> {
  String groupValue = "";
  List sorts = [
    "Дешёвые сперва",
    "Дорогие сперва",
    "Новые сперва",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Сортировать",
          style: TextStyle(
              color: AppConstants.kDarkGreyColor, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sorts.length,
          itemBuilder: (context, index) {
            final item = sorts[index];
            return WFilterSelectItem(
                groupValue: groupValue,
                onTap: (value) {
                  groupValue = value;
                  setState(() {});
                },
                title: item,
                value: item);
          },
        ),
      ],
    );
  }
}
