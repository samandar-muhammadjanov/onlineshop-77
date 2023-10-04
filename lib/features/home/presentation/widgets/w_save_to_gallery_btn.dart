
// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/features/home/data/model/m_product_detail.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_item_for_galery.dart';
import 'package:screenshot/screenshot.dart';

class WSaveToGalleryBtn extends StatelessWidget {
  const WSaveToGalleryBtn({
    super.key,
    required this.item,
  });
  final ProductDetail item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: WElevatedButton(
        onPressed: () async {
          final controller = ScreenshotController();
          final bytes = await controller.captureFromWidget(Material(
            child: SizedBox(
                width: 166,
                height: 280,
                child: WProductItemForGallery(item: item)),
          ));

          final result =
              await ImageGallerySaver.saveImage(Uint8List.fromList(bytes));
          if (result != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Saved to gallery"),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Try again"),
              ),
            );
          }
        },
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
    );
  }
}
