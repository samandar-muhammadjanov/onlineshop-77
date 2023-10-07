import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/features/common/widgets/w_divider.dart';
import 'package:onlineshop_77/features/common/widgets/w_selected_item.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WCategoryParent extends StatefulWidget {
  const WCategoryParent({
    super.key,
    required this.showChild,
  });

  final Function(bool, int) showChild;

  @override
  State<WCategoryParent> createState() => _WCategoryParentState();
}

class _WCategoryParentState extends State<WCategoryParent> {
  String groupValue = "";
  int categoryId = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          trailing: GestureDetector(onTap: () => Navigator.pop(context), child: SvgPicture.asset(AppAssets.close)),
        ),
        const WDivider(),
        // ListView.separated(
        //   separatorBuilder: (context, index) => const WDivider(),
        //   shrinkWrap: true,
        //   itemCount: widget.state.categories.length,
        //   itemBuilder: (context, index) {
        //     final item = widget.state.categories[index];
        //     return WSelectItem(
        //       groupValue: groupValue,
        //       onTap: (value) {
        //         groupValue = value;
        //         categoryId = index;
        //         setState(() {});
        //       },
        //       title: item.name,
        //       value: item.name,
        //     );
        //   },
        // ),
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
    );
  }
}
