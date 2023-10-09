import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/create_ads/domain/entities/ads_entity.dart';
import 'package:onlineshop_77/features/favorites/domain/entities/favorite_entity.dart';
import 'package:onlineshop_77/features/favorites/presentation/blocs/favorites_bloc.dart';

class WFavoriteButton extends StatelessWidget {
  const WFavoriteButton({
    super.key,
    required this.adsEntity,
  });

  final FavoritesEntity adsEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state.status.isSuccess) {
          return GestureDetector(
            onTap: () {
              // isFavorite(favoritesEntity.id)
              //     ? context.read<FavoritesBloc>().add(RemoveFromFavorites(item))
              //     : context.read<FavoritesBloc>().add(AddToFavorites(item));
            },
            child: SvgPicture.asset(
              AppAssets.heart,
              width: 24,
              color: AppColors.whiteColor,
            ),
          );
        }
        return SvgPicture.asset(
          AppAssets.heart,
          color: AppColors.whiteColor,
        );
      },
    );
  }
}
