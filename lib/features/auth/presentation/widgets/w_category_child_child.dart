import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/auth/presentation/bloc/bloc/category_bloc.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_selected_item.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_language_modal_popup.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

import 'w_category_child.dart';

class WCategoryChildChild extends StatefulWidget {
  const WCategoryChildChild({
    super.key,
    required this.widget,
    required this.categoryId,
    required this.groupValue,
    required this.showChild,
  });

  final WCategoryChild widget;
  final int categoryId;
  final String groupValue;
  final Function(bool, int) showChild;

  @override
  State<WCategoryChildChild> createState() => _WCategoryChildChildState();
}

class _WCategoryChildChildState extends State<WCategoryChildChild> {
  String groupValue = "";
  int categoryId = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            widget.showChild(true, widget.categoryId);
          },
          minLeadingWidth: 0,
          title: Row(
            children: [
              SvgPicture.asset(
                AppAssets.chevronLeft,
                color: AppConstants.kBlackColor,
              ),
              Text(
                widget.widget.state.categories[widget.widget.categoryId]
                    .childs[widget.categoryId].name,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              )
            ],
          ),
          trailing: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(AppAssets.close)),
        ),
        const WDivider(),
        ListView.separated(
          separatorBuilder: (context, index) => const WDivider(),
          shrinkWrap: true,
          itemCount: (widget.widget.state.categories[widget.widget.categoryId]
                  .childs[widget.categoryId].childs as List)
              .length,
          itemBuilder: (context, index) {
            final item = (widget
                .widget
                .state
                .categories[widget.widget.categoryId]
                .childs[widget.categoryId]
                .childs as List)[index];

            return ListTile(
              title: WSelectItem(
                  groupValue: groupValue,
                  onTap: (value) {
                    groupValue = value;
                    categoryId = item["id"];
                    setState(() {});
                  },
                  title: item["name"],
                  value: item["name"]),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: WElevatedButton(
            onPressed: () {
              context
                  .read<CategoryBloc>()
                  .add(CategoryEvent(groupValue, categoryId));
              Navigator.pop(context);
            },
            child: Text(
              LocaleKeys.select.tr(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
