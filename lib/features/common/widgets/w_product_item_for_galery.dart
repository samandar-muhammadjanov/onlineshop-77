import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import 'package:onlineshop_77/features/categories/presentation/pages/product_detail_screen.dart';
import 'package:onlineshop_77/features/home/data/model/m_product_detail.dart';

class WProductItemForGallery extends StatelessWidget {
  const WProductItemForGallery({
    super.key,
    required this.item,
  });

  final ProductDetail item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(slug: item.slug),
        ),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Stack(
                  children: [
                    Image.network(
                      "https://backendmaster.pythonanywhere.com/${item.photos.first}",
                      height: 130,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    ),
                    Container(
                      height: 130 * 0.9,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.center,
                          colors: [
                            const Color(0xff17181A).withOpacity(0.72),
                            const Color(0xff17181A).withOpacity(0.22),
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 140,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(6)),
                    child: Text(
                      item.address.district.region.name,
                      style: const TextStyle(
                        color: AppColors.darkGreyColor,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const Gap(),
                  const Spacer(),
                  Text(
                    item.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    item.publishedAt.formatApiDate(),
                    style: const TextStyle(
                        fontSize: 10, color: AppColors.darkGreyColor),
                  ),
                  const Gap(),
                  Text(
                    item.seller.phoneNumber.formatPhoneNumberWithSpaces(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.darkGreyColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: AppColors.blackColor),
                      children: [
                        TextSpan(
                          text: "${item.price.formatWithSpaces()}  ",
                          style: const TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: item.currency == "uzs" ? "UZS" : "USD",
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap()
                ],
              ),
            ),
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
      height: 8,
    );
  }
}
