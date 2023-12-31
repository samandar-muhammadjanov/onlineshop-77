import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WCanselModalPopup extends StatelessWidget {
  const WCanselModalPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 5,
          width: 36,
          decoration: BoxDecoration(
              color: const Color(0xffD5D8DB),
              borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppConstants.kWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(AppAssets.close),
                    )
                  ],
                ),
              ),
              SvgPicture.asset(
                AppAssets.canselwishlist,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Отменить создания объявления",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Вы точно хотите отменить создание объявления, все ваши изменения не будут сохранены",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppConstants.kGreyTextColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: WElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        color: AppConstants.kGreyColor,
                        child: Text(
                          "Назад",
                          style: TextStyle(
                            color: AppConstants.kBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          LocaleKeys.cancel.tr(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16)
            ],
          ),
        ),
      ],
    );
  }
}
