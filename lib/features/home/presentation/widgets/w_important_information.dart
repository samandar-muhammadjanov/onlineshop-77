import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/auth/presentation/bloc/bloc/category_bloc.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_text_field.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_category_modalpopup.dart';

class WImportantInformations extends StatefulWidget {
  const WImportantInformations({
    super.key,
    required this.getImportantIInfo,
    required this.formKey,
  });
  final Function(String, int, String) getImportantIInfo;
  final GlobalKey<FormState> formKey;
  @override
  State<WImportantInformations> createState() => _WImportantInformationsState();
}

class _WImportantInformationsState extends State<WImportantInformations> {
  int categoryId = 0;
  String productName = '';
  String categoryName = '';
  String description = '';
  void _getCategoryId(int id, String name) {
    setState(() {
      categoryId = id;
      categoryName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppConstants.kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.necessaryInfo.tr(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          WTextField(
            validator: (value) {
              if (value!.isEmpty) {
                return "*required";
              }
              return null;
            },
            onFieldSubmitted: (value) {
              productName = value;
              setState(() {});
              widget.getImportantIInfo(productName, categoryId, description);
            },
            title: LocaleKeys.productName.tr(),
            hint: LocaleKeys.enterProductName.tr(),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            LocaleKeys.category.tr(),
            style: const TextStyle(
              color: AppConstants.kGreyTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => const WCategoryModalPopup());
            },
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppConstants.kBackgroundColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      return Text(state.name.isEmpty
                          ? LocaleKeys.selectCategory.tr()
                          : state.name);
                    },
                  ),
                  SvgPicture.asset(AppAssets.chevronDown)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          WTextField(
            validator: (value) {
              if (value!.isEmpty) {
                return "*required";
              }
              return null;
            },
            onFieldSubmitted: (value) {
              description = value;
              widget.getImportantIInfo(productName, categoryId, description);
              setState(() {});
            },
            title: LocaleKeys.description.tr(),
            maxLines: 5,
            hint: LocaleKeys.enterDesciption.tr(),
          )
        ],
      ),
    );
  }
}
