import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/categories/categories_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_divider.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_selected_item.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_language_modal_popup.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

import 'w_category_child_child.dart';

class WCategoryChild extends StatefulWidget {
  const WCategoryChild({
    super.key,
    required this.state,
    required this.showChild,
    required this.categoryId,
  });
  final CategoriesLoaded state;
  final int categoryId;
  final Function(bool, int) showChild;

  @override
  State<WCategoryChild> createState() => _WCategoryChildState();
}

class _WCategoryChildState extends State<WCategoryChild> {
  String groupValue = "";
  int categoryId = 0;
  bool isParentCategory = true;
  void showChild(bool isChild, int categoryId) {
    isParentCategory = isChild;
    this.categoryId = categoryId;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.state.categories[widget.categoryId].name;
    if (!isParentCategory) {
      return WCategoryChildChild(
        widget: widget,
        categoryId: categoryId,
        groupValue: groupValue,
        showChild: showChild,
      );
    }

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
                title,
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
        AnimationLimiter(
          child: ListView.separated(
            separatorBuilder: (context, index) => const WDivider(),
            shrinkWrap: true,
            itemCount: widget.state.categories[widget.categoryId].childs.length,
            itemBuilder: (context, index) {
              final item =
                  widget.state.categories[widget.categoryId].childs[index];
              if (item.childs == null) {
                return const SizedBox();
              }
              return AnimationConfiguration.staggeredList(
                position: index,
                child: FadeInAnimation(
                  child: WSelectItem(
                      groupValue: groupValue,
                      onTap: (value) {
                        groupValue = value;
                        categoryId = index;
                        setState(() {});
                      },
                      title: item.name,
                      value: item.name),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: WElevatedButton(
            onPressed: () {
              showChild(false, categoryId);
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
