import 'package:flutter/material.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import 'package:onlineshop_77/features/home/data/model/m_my_products.dart';
import 'package:onlineshop_77/features/home/presentation/product_detail_screen.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_active_status.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_pending_status.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_unactive_status.dart';

import '../../../../assets/constants/constants.dart';

class WMyProductItem extends StatelessWidget {
  const WMyProductItem({
    super.key,
    required this.item,
  });

  final MyProducts item;

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
                    if (item.extra.status == "active") ...{
                      WActiveStatus(date: item.extra.expiresAt)
                    } else if (item.extra.status == "inactive") ...{
                      const WUnactiveStatus()
                    } else if (item.extra.status == "pending") ...{
                      const WPendingStatus()
                    }
                  ],
                ),
              ),
            ),
            Container(
              height: 140,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: const BoxDecoration(
                color: AppConstants.kWhiteColor,
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
                        color: AppConstants.kBackgroundColor,
                        borderRadius: BorderRadius.circular(6)),
                    child: Text(
                      item.address.district.region.name,
                      style: const TextStyle(
                        color: AppConstants.kDarkGreyColor,
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
                        fontSize: 10, color: AppConstants.kDarkGreyColor),
                  ),
                  const Gap(),
                  Text(
                    item.seller.phoneNumber.formatPhoneNumberWithSpaces(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppConstants.kDarkGreyColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: AppConstants.kBlackColor),
                      children: [
                        TextSpan(
                          text: "${item.price.formatWithSpaces()}  ",
                          style: const TextStyle(
                            color: AppConstants.kBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: item.currency == "uzs" ? "UZS" : "USD",
                          style: const TextStyle(
                            color: AppConstants.kPrimaryColor,
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
