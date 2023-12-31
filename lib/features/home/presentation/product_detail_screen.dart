import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/productDetail/product_detail_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_appbar.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_pd_image.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_detail_about_seller.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_detail_description.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_detail_location.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_detail_shimmer.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.slug});
  final String slug;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  GlobalKey globalKey = GlobalKey();
  Uint8List? imageMemory;
  Future<Uint8List> _capturePng() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    if (boundary.debugNeedsPaint) {
      print("Waiting for boundary to be painted.");
      await Future.delayed(const Duration(milliseconds: 20));
      return _capturePng();
    }

    var image = await boundary.toImage(pixelRatio: 0.5);
    var byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  void _printPngBytes() async {
    var pngBytes = await _capturePng();
    var bs64 = base64Encode(pngBytes);
    imageMemory = pngBytes;
    setState(() {});
    print(pngBytes);
    print(bs64);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WAppBar(),
      body: RepaintBoundary(
        key: globalKey,
        child: ListView(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          child: WElevatedButton(
                            onPressed: _printPngBytes,
                            color: AppConstants.kPrimaryColor.withOpacity(0.08),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Скачать в галерею",
                                  style: TextStyle(
                                      color: AppConstants.kPrimaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                SvgPicture.asset(AppAssets.download)
                              ],
                            ),
                          ),
                        ),
                        imageMemory != null
                            ? Image.memory(imageMemory!)
                            : Container(),
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
