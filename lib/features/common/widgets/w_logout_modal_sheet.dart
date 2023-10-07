import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/features/common/widgets/w_modal_sheet_scroller.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/auth/auth_bloc.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WLogoutModalSheet extends StatelessWidget {
  const WLogoutModalSheet({
    super.key,
  });

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
                AppAssets.logout02,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Выйти из платформы",
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
                  "Вы точно хотите выйти из платформы",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.greyTextColor,
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
                        color: AppColors.greyColor,
                        child: const Text(
                          "Отменить",
                          style: TextStyle(
                            color: AppColors.blackColor,
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
                        onPressed: () async {
                          SharedPreferences preferences = await SharedPreferences.getInstance();
                          preferences.clear();
                          context.read<AuthBloc>().add(AuthinticatedEvent());
                          Navigator.pop(context);
                        },
                        color: AppColors.redColor.withOpacity(0.10),
                        child: Text(
                          LocaleKeys.logout.tr(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.redColor,
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
        )
      ],
    );
  }
}
