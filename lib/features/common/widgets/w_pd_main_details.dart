import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/features/home/data/model/m_product_detail.dart';
import 'package:url_launcher/url_launcher.dart';

class WPDMainDetails extends StatelessWidget {
  const WPDMainDetails({
    super.key,
    required this.product,
  });
  final ProductDetail product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              product.category.name,
              style: const TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 12,
              ),
            ),
            const Gap(),
            Container(
              height: 4,
              width: 4,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primaryColor),
            ),
            const Gap(),
            Text(
              product.category.parentCategory["name"],
              style: const TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 12,
              ),
            ),
            const Gap(),
            Container(
              height: 4,
              width: 4,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primaryColor),
            ),
            const Gap(),
            Text(
              product.id.toString(),
              style: const TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const Gap(),
        Text(
          product.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                product.publishedAt.formatApiDate(),
                style: const TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 10,
                ),
              ),
            ),
            const Gap(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                "г. ${product.address.district.region.name}",
                style: const TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(color: AppColors.blackColor),
            children: [
              TextSpan(
                text: product.price.formatWithSpaces(),
                style: const TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const TextSpan(text: " "),
              TextSpan(
                text: product.currency == "uzs" ? "UZS" : "USD",
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        WElevatedButton(
          onPressed: () async {
            final Uri url = Uri(
                scheme: "tel",
                path: product.seller.phoneNumber.formatPhoneNumberWithSpaces());

            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              print("Cannot Launch Url");
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                product.seller.phoneNumber.formatPhoneNumberWithSpaces(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset(AppAssets.phone02)
            ],
          ),
        )
      ],
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
      width: 8,
    );
  }
}
