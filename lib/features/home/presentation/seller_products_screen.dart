import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:onlineshop_77/core/utils/exports.dart';
import 'package:onlineshop_77/core/utils/size_config.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_appbar.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_item.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_shimmer.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_seller.dart';

class SellerProductsScreen extends StatelessWidget {
  const SellerProductsScreen({super.key});
  static const String routeName = "/seller/products";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: const WAppBar(),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            final seller = state.products.results[0].seller;
            return ListView(
              children: [
                WSellerData(seller: seller),
                AnimationLimiter(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.products.results.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 12,
                      crossAxisCount: 2,
                      childAspectRatio: wi(0.598),
                    ),
                    itemBuilder: (context, index) {
                      final item = state.products.results[index];
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        columnCount: 2,
                        child: FadeInAnimation(
                          child: WProductItem(item: item),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          } else {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: WProductShimmer(),
            );
          }
        },
      ),
    );
  }
}
