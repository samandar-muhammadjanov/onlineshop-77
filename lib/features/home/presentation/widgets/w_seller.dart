import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/utils/exports.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/m_product.dart';

class WSellerData extends StatelessWidget {
  const WSellerData({
    super.key,
    required this.seller,
  });

  final Seller seller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppConstants.kWhiteColor,
        border: Border.symmetric(
          horizontal: BorderSide(color: AppConstants.kBackgroundColor),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    context.read<ProductBloc>().add(GetProductsEvent(""));
                  },
                  child: SvgPicture.asset(AppAssets.arrowLeft)),
              const SizedBox(width: 16),
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: seller.profilePhoto == ""
                      ? null
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            "${AppConstants.siteurl}${seller.profilePhoto}",
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                  title: Text(
                    seller.fullName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "ID: ${seller.id}",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          WElevatedButton(
            onPressed: () async {
              final Uri url = Uri(
                  scheme: "tel",
                  path: seller.phoneNumber.formatPhoneNumberWithSpaces());

              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                print("Cannot Launch Url");
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.phone02),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  seller.phoneNumber.formatPhoneNumberWithSpaces(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
