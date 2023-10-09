import 'package:formz/formz.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop_77/features/profile/presentation/blocs/profile/user_bloc.dart';
import 'package:shimmer/shimmer.dart';

class WProfileHeader extends StatelessWidget {
  const WProfileHeader({
    super.key,
    this.otherDatas,
  });
  final Widget? otherDatas;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(GetUserDataEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.status.isSuccess) {
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.backgroundColor),
                  borderRadius: BorderRadius.circular(8)),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 0),
                            blurRadius: 30,
                            spreadRadius: 0,
                            color: AppColors.darkGreyColor.withAlpha(180))
                      ],
                      color: AppColors.darkGreyColor,
                      border: Border.all(color: AppColors.whiteColor),
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        state.userEntity.profilePhoto,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    state.userEntity.fullName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  otherDatas ?? const SizedBox()
                ],
              ),
            );
          }
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.backgroundColor),
                borderRadius: BorderRadius.circular(8)),
            width: double.infinity,
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 30,
                              spreadRadius: 0,
                              color: AppColors.darkGreyColor.withAlpha(180))
                        ],
                        color: AppColors.darkGreyColor,
                        border: Border.all(color: AppColors.whiteColor),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 20,
                    width: 100,
                    color: AppColors.whiteColor,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
