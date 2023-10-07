import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/common/widgets/w_appbar_language_item.dart';
import 'package:onlineshop_77/features/common/widgets/w_profile_header.dart';
import 'package:onlineshop_77/features/common/widgets/w_user_ther_data.dart';
import 'package:onlineshop_77/features/profile/presentation/blocs/profile/user_bloc.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

import '../../../../assets/assets.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leadingWidth: 92,
        elevation: 0.5,
        centerTitle: true,
        leading: const WAppBarLanguageItem(),
        title: SvgPicture.asset(
          AppAssets.logo,
          width: 77,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(AppAssets.arrowLeft),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                LocaleKeys.personalInfo.tr(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24.5,
          ),
          WProfileHeader(
            otherDatas: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state.status.isSuccess) {
                  final item = state.userData;
                  return WUserOtherData(item: item);
                } else {
                  return const SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
