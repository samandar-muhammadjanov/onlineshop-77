import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/features/common/widgets/w_appbar.dart';
import 'package:onlineshop_77/features/common/widgets/w_pd_image.dart';
import 'package:onlineshop_77/features/common/widgets/w_product_detail_about_seller.dart';
import 'package:onlineshop_77/features/common/widgets/w_product_detail_description.dart';
import 'package:onlineshop_77/features/common/widgets/w_product_detail_location.dart';
import 'package:onlineshop_77/features/common/widgets/w_product_detail_shimmer.dart';
import 'package:onlineshop_77/features/common/widgets/w_save_to_gallery_btn.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/productDetail/product_detail_bloc.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.slug});
  final String slug;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Uint8List? bytes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WAppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: SvgPicture.asset(AppAssets.arrowLeft),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => ProductDetailBloc()
              ..add(
                GetProductDetail(
                  widget.slug,
                ),
              ),
            child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
              builder: (context, state) {
                if (state is ProductDetailInitial) {
                  return const WProductDetailShimmer();
                } else if (state is ProductDetailLoading) {
                  return const WProductDetailShimmer();
                } else if (state is ProductDetailError) {
                  return const WProductDetailShimmer();
                } else if (state is ProductDetailLoaded) {
                  final product = state.productDetail;
                  return Column(
                    children: [
                      WProductImages(product: product),
                      const Gap(),
                      WProductDetailDescription(
                          description: product.description),
                      const Gap(),
                      WPDAboutSeller(seller: product.seller),
                      const Gap(),
                      WPDLocation(address: product.address),
                      WSaveToGalleryBtn(item: product),
                    ],
                  );
                } else {
                  return const WProductDetailShimmer();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class Gap extends StatelessWidget {
  const Gap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}
