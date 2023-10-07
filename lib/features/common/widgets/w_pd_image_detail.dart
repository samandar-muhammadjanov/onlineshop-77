import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';

class WPDImageDetail extends StatefulWidget {
  const WPDImageDetail({
    super.key,
    required this.photos,
  });
  final List photos;
  @override
  State<WPDImageDetail> createState() => _WPDImageDetailState();
}

class _WPDImageDetailState extends State<WPDImageDetail> {
  int currentImage = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final photos = widget.photos;
    return Column(
      children: [
        SizedBox(
          height: 266,
          child: PageView.builder(
            onPageChanged: (index) {
              currentImage = index;
              setState(() {});
            },
            controller: pageController,
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                key: ValueKey(photos[index]),
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://backendmaster.pythonanywhere.com${photos[index]}",
                  height: 266,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: photos.length <= 1 ? 0 : 12,
        ),
        photos.length <= 1
            ? const SizedBox()
            : Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 44,
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: [
                        AppColors.whiteColor.withOpacity(.3),
                        AppColors.whiteColor,
                        AppColors.whiteColor,
                        AppColors.whiteColor.withOpacity(.3),
                      ],
                      stops: const [0.0, 0.1, 0.9, 1.0],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds);
                  },
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final photo = photos[index];
                      return GestureDetector(
                        key: ValueKey(photos[index]),
                        onTap: () {
                          currentImage = index;
                          pageController.animateToPage(currentImage,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: currentImage == index
                                ? AppColors.primaryColor
                                : AppColors.greyColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: currentImage == index
                                  ? AppColors.primaryColor
                                  : AppColors.greyColor,
                              width: currentImage == index ? 2 : 1,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              "https://backendmaster.pythonanywhere.com$photo",
                              fit: BoxFit.cover,
                              width: 64,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: photos.length <= 1 ? 0 : photos.length,
                  ),
                ),
              )
      ],
    );
  }
}
