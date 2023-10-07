import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/features/common/widgets/w_cansel_modal_popup.dart';
import 'package:onlineshop_77/features/home/data/repositories/data_repository.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WPublish extends StatefulWidget {
  const WPublish({
    super.key,
    required this.productName,
    required this.categoryId,
    required this.description,
    required this.price,
    required this.currency,
    required this.paths,
    required this.formKey,
  });
  final String productName;
  final int categoryId;
  final String description;
  final int price;
  final String currency;
  final List<XFile> paths;
  final GlobalKey<FormState> formKey;

  @override
  State<WPublish> createState() => _WPublishState();
}

bool isAgree = false;

class _WPublishState extends State<WPublish> {
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
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAgree = !isAgree;
                  });
                },
                child: Container(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: isAgree
                          ? AppColors.primaryColor
                          : AppColors.transparent,
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(6)),
                  child: isAgree
                      ? const Icon(
                          Icons.check,
                          size: 16,
                          color: AppColors.whiteColor,
                        )
                      : const SizedBox(),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: LocaleKeys.agreeWithTermsofuse1.tr(),
                    ),
                    TextSpan(
                        text: LocaleKeys.agreeWithTermsofuse2.tr(),
                        style:
                            const TextStyle(color: AppColors.primaryColor)),
                    TextSpan(
                      text: LocaleKeys.agreeWithTermsofuse3.tr(),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  customBorder: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return const WCanselModalPopup();
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        LocaleKeys.cancel.tr(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.blackColor),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              Expanded(
                child: WElevatedButton(
                  onPressed: () {
                    print(widget.categoryId);
                    if (widget.formKey.currentState!.validate()) {
                      HomeRepository.addProduct(
                          widget.productName,
                          widget.currency,
                          widget.price,
                          widget.description,
                          widget.paths,
                          widget.categoryId,
                          context);
                    }
                  },
                  color: !isAgree ? AppColors.greyColor : null,
                  child: Text(
                    LocaleKeys.publish.tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: isAgree
                            ? AppColors.whiteColor
                            : AppColors.blackColor),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
