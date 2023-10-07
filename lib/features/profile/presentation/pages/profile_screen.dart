import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/common/widgets/w_logout_modal_sheet.dart';
import 'package:onlineshop_77/features/common/widgets/w_profile_body.dart';
import 'package:onlineshop_77/features/common/widgets/w_profile_header.dart';
import 'package:onlineshop_77/features/common/widgets/w_profile_unauth.dart';

import '../../../auth/presentation/bloc/auth/auth_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.loginStatus.isSuccess) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
              elevation: 0.4,
              title: SvgPicture.asset(
                AppAssets.logo,
                width: 77,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () async {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: AppColors.transparent,
                      builder: (context) {
                        return const WLogoutModalSheet();
                      },
                    );
                  },
                  icon: SvgPicture.asset(AppAssets.logout),
                )
              ],
            ),
            body: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: const [
                WProfileHeader(),
                WProfileBody(),
              ],
            ),
          );
        } else {
          return const WProfileUnAuth();
        }
      },
    );
  }
}
