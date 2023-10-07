import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
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
        color: AppColors.whiteColor,
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
          TextFieldWithTitle(
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
              color: AppColors.greyTextColor,
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
                  color: AppColors.backgroundColor,
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
          Text(
            LocaleKeys.description.tr(),
            style: const TextStyle(
              color: AppColors.darkGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "*required";
                }
                return null;
              },
              style: const TextStyle(fontSize: 14),
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              textCapitalization: TextCapitalization.words,
              maxLines: 5,
              maxLength: 1000,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                hintText: LocaleKeys.enterDesciption.tr(),
                hintStyle: const TextStyle(color: AppColors.hintColor),
                fillColor: AppColors.backgroundColor,
                filled: true,
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
