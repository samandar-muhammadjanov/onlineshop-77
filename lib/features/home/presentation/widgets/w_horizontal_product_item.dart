import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import 'package:onlineshop_77/features/home/presentation/product_detail_screen.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_favorite_button.dart';

import '../../data/model/m_product.dart';

class WHorizontalProductItem extends StatelessWidget {
  const WHorizontalProductItem({super.key, required this.item});
  final Result item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(slug: item.slug),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: AppConstants.kWhiteColor,
            borderRadius: BorderRadius.circular(12)),
        height: 127,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppConstants.kWhiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  border: Border.all(color: AppConstants.kWhiteColor)),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.network(
                      "https://backendmaster.pythonanywhere.com${item.photos[0]}",
                      height: 125.94,
                      fit: BoxFit.cover,
                      width: 120,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: 70,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.center,
                          colors: [
                            const Color(0xff17181A).withOpacity(0.72),
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: WFavoriteButton(item: item),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: AppConstants.kBackgroundColor,
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          "р. ${item.address.district.name}",
                          style: const TextStyle(
                            color: AppConstants.kDarkGreyColor,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Text(
                          item.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    item.publishedAt.formatApiDate(),
                    style: const TextStyle(
                        fontSize: 10, color: AppConstants.kDarkGreyColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
