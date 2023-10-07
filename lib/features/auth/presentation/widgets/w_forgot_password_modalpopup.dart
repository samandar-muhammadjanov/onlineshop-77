import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/common/widgets/w_modal_sheet_scroller.dart';

class ForgotPasswordModalPopup extends StatelessWidget {
  const ForgotPasswordModalPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const WModalSheetScroller(),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(AppAssets.close),
                    )
                  ],
                ),
                SvgPicture.asset(AppAssets.forgotPasswordInfo),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Забыли пароль? Для восстановления пароля обратитесь администратору",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.darkGreyColor,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shadowColor: AppColors.whiteColor,
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  label: const Text(
                    "+998 97 450 45 00",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  icon: SvgPicture.asset(AppAssets.phone02),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
