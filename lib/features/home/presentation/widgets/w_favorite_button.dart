import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/data/model/m_product.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/favorites/favorites_bloc.dart';

class WFavoriteButton extends StatelessWidget {
  const WFavoriteButton({
    super.key,
    required this.item,
  });

  final Result item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoaded) {
          bool isFavorite(int productId) {
            return state.favorites.products.any((element) {
              return element.id == productId;
            });
          }

          return GestureDetector(
            onTap: () {
              isFavorite(item.id)
                  ? context.read<FavoritesBloc>().add(RemoveFromFavorites(item))
                  : context.read<FavoritesBloc>().add(AddToFavorites(item));
            },
            child: SvgPicture.asset(
              isFavorite(item.id) ? AppAssets.heartFill : AppAssets.heart,
              width: 24,
              color: isFavorite(item.id)
                  ? AppConstants.kRedColor
                  : AppConstants.kWhiteColor,
            ),
          );
        }
        return SvgPicture.asset(
          AppAssets.heart,
          color: AppConstants.kWhiteColor,
        );
      },
    );
  }
}
