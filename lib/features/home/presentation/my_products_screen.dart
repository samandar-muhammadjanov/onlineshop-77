import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/core/utils/size_config.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/features/home/presentation/add_product_screen.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/userProduct/user_product_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_appbar_language_item.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_my_products_item.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_shimmer.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

import '../../../assets/assets.dart';

class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({super.key});
  static const String routeName = "/ads/my";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 92,
        leading: const WAppBarLanguageItem(),
        title: SvgPicture.asset(
          AppAssets.logo,
          width: 77,
        ),
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              context.read<UserProductBloc>().add(GetUserProducts());
            },
            child: ListView(
              physics: const BouncingScrollPhysics(),
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
                      LocaleKeys.myProducts.tr(),
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
                BlocBuilder<UserProductBloc, UserProductState>(
                  builder: (context, state) {
                    if (state is UserProductInitial) {
                      return const WProductShimmer();
                    } else if (state is UserProductLoading) {
                      return const WProductShimmer();
                    } else if (state is UserProductError) {
                      return Text(state.error);
                    } else if (state is UserProductLoaded) {
                      return AnimationLimiter(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.userProducts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 12,
                            crossAxisCount: 2,
                            childAspectRatio: wi(0.598),
                          ),
                          itemBuilder: (context, index) {
                            final item = state.userProducts[index];

                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 500),
                              columnCount: 2,
                              child: FadeInAnimation(
                                child: WMyProductItem(item: item),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return const WProductShimmer();
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 0),
              child: WElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AddProductScreen.routeName),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.createProduct.tr(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SvgPicture.asset(AppAssets.plus)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
