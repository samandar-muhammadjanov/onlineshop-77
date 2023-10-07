import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/common/widgets/w_divider.dart';
import 'package:onlineshop_77/features/common/widgets/w_modal_sheet_scroller.dart';
import 'package:onlineshop_77/features/common/widgets/w_selected_item.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/miniCategory/mini_category_bloc.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WMiniCategoriesModalSheet extends StatefulWidget {
  const WMiniCategoriesModalSheet({
    super.key,
    required this.value,
  });
  final String value;
  @override
  State<WMiniCategoriesModalSheet> createState() =>
      _WMiniCategoriesModalSheetState();
}

class _WMiniCategoriesModalSheetState extends State<WMiniCategoriesModalSheet> {
  List categories = [
    "Все объявления",
    "Популярные",
    "Подешевле",
    "Подороже",
    "Добавленные недавно"
  ];
  late String groupValue;
  @override
  void initState() {
    super.initState();
    groupValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const WModalSheetScroller(),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
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
                trailing: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppAssets.close),
                ),
              ),
              const WDivider(),
              ListView.separated(
                separatorBuilder: (context, index) => const WDivider(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final item = categories[index];
                  return WSelectItem(
                      groupValue: groupValue,
                      onTap: (value) {
                        groupValue = value;
                        context
                            .read<MiniCategoryBloc>()
                            .add(SetCategoryEvent(value));
                        setState(() {});
                        Navigator.pop(context);
                      },
                      title: item,
                      value: item);
                },
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        )
      ],
    );
  }
}
