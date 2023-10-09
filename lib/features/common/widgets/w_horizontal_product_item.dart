import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/categories/presentation/pages/product_detail_screen.dart';
import 'package:onlineshop_77/features/common/widgets/w_favorite_button.dart';
import 'package:onlineshop_77/features/create_ads/domain/entities/ads_entity.dart';

class WHorizontalProductItem extends StatelessWidget {
  const WHorizontalProductItem({super.key, required this.item});

  final AdsEntity item;

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
        decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(12)),
        height: 127,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  border: Border.all(color: AppColors.whiteColor)),
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
                          colors: [const Color(0xff17181A).withOpacity(0.72), Colors.transparent],
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 10,
                  //   left: 10,
                  //   child:
                  //   WFavoriteButton(
                  //     adsEntity: item,
                  //   ),
                  // )
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
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration:
                            BoxDecoration(color: AppColors.backgroundColor, borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          "р. ${item.address}",
                          style: const TextStyle(
                            color: AppColors.darkGreyColor,
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
                    item.publishedAt,
                    style: const TextStyle(fontSize: 10, color: AppColors.darkGreyColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: AppColors.blackColor),
                      children: [
                        TextSpan(
                          text: item.price,
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
