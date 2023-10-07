import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_text_field.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/user/user_bloc.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WContactInformation extends StatelessWidget {
  const WContactInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.contactInfo.tr(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldWithTitle(
                  readOnly: true,
                  title: LocaleKeys.fio.tr(),
                  controller:
                      TextEditingController(text: state.userData.fullName),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldWithTitle(
                  readOnly: true,
                  title: LocaleKeys.email.tr(),
                  controller: TextEditingController(text: state.userData.email),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldWithTitle(
                  readOnly: true,
                  title: LocaleKeys.phoneNumber.tr(),
                  hint: "(__) ___-__-__",
                  controller: TextEditingController(
                      text: state.userData.phoneNumber
                          .formatPhoneNumberWithSpaces()),
                )
              ],
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.contactInfo.tr(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldWithTitle(title: LocaleKeys.contactInfo.tr()),
              const SizedBox(
                height: 16,
              ),
              TextFieldWithTitle(
                title: LocaleKeys.email.tr(),
                hint: "77shop@gmail.com",
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldWithTitle(
                title: LocaleKeys.phoneNumber.tr(),
                hint: "(__) ___-__-__",
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("+998"),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
