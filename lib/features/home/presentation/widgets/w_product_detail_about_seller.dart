import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/data/model/m_product_detail.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_product_detail_seller_phone.dart';
import '../../../../generated/locale_keys.g.dart';

class WPDAboutSeller extends StatelessWidget {
  const WPDAboutSeller({
    super.key,
    required this.seller,
  });
  final Seller seller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: AppConstants.kWhiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.seller.tr(),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: seller.profilePhoto == ""
                ? null
                : CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      "https://backendmaster.pythonanywhere.com${seller.profilePhoto}",
                    ),
                  ),
            title: Text(
              seller.fullName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "ID: ${seller.id}",
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ShowPhoneNumber(
            phoneNumber: seller.phoneNumber,
          )
        ],
      ),
    );
  }
}
