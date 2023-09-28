import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

import 'w_select_photo.dart';

class WPhoto extends StatefulWidget {
  const WPhoto({
    super.key,
    required this.getImages,
  });
  final Function(List<XFile>) getImages;

  @override
  State<WPhoto> createState() => _WPhotoState();
}

class _WPhotoState extends State<WPhoto> {
  List<XFile> images = [];
  void _getImages(List<XFile> images) {
    setState(() {
      this.images = images;
    });
    widget.getImages(images);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppConstants.kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.photo.tr(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            LocaleKeys.photoDescription.tr(),
            style: const TextStyle(
              fontSize: 12,
              color: AppConstants.kGreyTextColor,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          WSelectImage(
            getImages: _getImages,
          )
        ],
      ),
    );
  }
}
