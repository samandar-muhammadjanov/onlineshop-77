// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/assets/assets.dart';

class WSelectImage extends StatefulWidget {
  const WSelectImage({super.key, required this.getImages});
  final Function(List<XFile>) getImages;
  @override
  State<WSelectImage> createState() => _WSelectImageState();
}

class _WSelectImageState extends State<WSelectImage> {
  final List<XFile> _selectedImages = [];
  void selectImages() async {
    final List<XFile> selectedImages = await ImagePicker().pickMultiImage();
    if (selectedImages == null) return;
    _selectedImages.addAll(selectedImages);
    widget.getImages(_selectedImages);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ReorderableGridView.builder(
          onReorder: (oldIndex, newIndex) {
            XFile path = _selectedImages.removeAt(oldIndex);
            _selectedImages.insert(newIndex, path);
            setState(() {});
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _selectedImages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.35,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            final image = _selectedImages[index];
            return Stack(
              key: ValueKey(index),
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppConstants.kGreyColor),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(image.path),
                      height: 132,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 32.0,
                        height: 32.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(255, 255, 255, 0.09),
                          ),
                          color: const Color.fromRGBO(23, 24, 26, 0.3),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(AppAssets.menu),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedImages.remove(image);
                          });
                        },
                        child: Container(
                          width: 32.0,
                          height: 32.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(255, 255, 255, 0.09),
                            ),
                            color: const Color.fromRGBO(23, 24, 26, 0.3),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(AppAssets.trash),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GestureDetector(
            onTap: selectImages,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              color: AppConstants.kGreyTextColor,
              child: Container(
                width: _selectedImages.isEmpty
                    ? double.infinity
                    : MediaQuery.of(context).size.width * 0.41,
                height: 132,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppConstants.kBackgroundColor),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.imageAdd),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      LocaleKeys.selectImage.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
