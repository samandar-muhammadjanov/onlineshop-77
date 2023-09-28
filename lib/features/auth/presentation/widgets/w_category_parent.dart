import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/categories/categories_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_language_item.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_language_modal_popup.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class WCategoryParent extends StatefulWidget {
  const WCategoryParent({
    super.key,
    required this.state,
    required this.showChild,
  });
  final Function(bool, int) showChild;
  final CategoriesLoaded state;

  @override
  State<WCategoryParent> createState() => _WCategoryParentState();
}

class _WCategoryParentState extends State<WCategoryParent> {
  String groupValue = "";
  int categoryId = 0;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        children: [
          ListTile(
            minLeadingWidth: 0,
            title: Text(
              LocaleKeys.selectCategory.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            trailing: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(AppAssets.close)),
          ),
          const WDivider(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.state.categories.length,
            itemBuilder: (context, index) {
              final item = widget.state.categories[index];
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: WElevatedButton(
              onPressed: () {
                widget.showChild(false, categoryId);
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
      ),
    );
  }
}
