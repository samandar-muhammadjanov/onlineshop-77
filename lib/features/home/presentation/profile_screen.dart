// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/auth/auth_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_logout_modal_sheet.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_profile_body.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_profile_header.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_profile_unauth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoaded) {
          if (state.isAuthinticated) {
            return Scaffold(
              backgroundColor: AppConstants.kWhiteColor,
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
                        backgroundColor: AppConstants.kTransparent,
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
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
