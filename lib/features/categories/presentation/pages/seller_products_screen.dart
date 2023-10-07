import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop_77/core/utils/size_config.dart';
import 'package:onlineshop_77/features/common/widgets/w_appbar.dart';
import 'package:onlineshop_77/features/common/widgets/w_product_item.dart';
import 'package:onlineshop_77/features/common/widgets/w_product_shimmer.dart';
import 'package:onlineshop_77/features/common/widgets/w_seller.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/productBloc/product_bloc.dart';

class SellerProductsScreen extends StatelessWidget {
  const SellerProductsScreen({super.key});

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
                // WSellerData(seller: seller),
                GridView.builder(
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
                    return WProductItem(item: item);
                  },
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
