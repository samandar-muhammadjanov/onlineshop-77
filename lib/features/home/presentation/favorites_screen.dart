import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/core/utils/size_config.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_item.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_shimmer.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(AppAssets.arrowLeft),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              LocaleKeys.favorites.tr(),
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
        BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesLoaded) {
              return AnimationLimiter(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.favorites.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 12,
                    crossAxisCount: 2,
                    childAspectRatio: wi(0.598),
                  ),
                  itemBuilder: (context, index) {
                    final item = state.favorites.products[index];
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,
                      duration: const Duration(milliseconds: 500),
                      key: Key(item.id.toString()),
                      child: FadeInAnimation(
                        child: WProductItem(item: item),
                      ),
                    );
                  },
                ),
              );
            }
            return const WProductShimmer();
          },
        )
      ],
    );
  }
}
