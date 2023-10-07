import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0.5,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(AppAssets.arrowLeftSm),
        ),
        centerTitle: true,
        title: Text(
          LocaleKeys.aboutApp.tr(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        physics: const BouncingScrollPhysics(),
        children: [
          SvgPicture.asset(AppAssets.applogo),
          const SizedBox(
            height: 24,
          ),
          const Text(
            '''Маркетплейс - это виртуальная торговая площадка, где вы можете найти все, что только пожелаете. Этот удивительный веб-сайт объединяет миллионы товаров от различных продавцов, предоставляя вам широкий выбор продукции на любой вкус и бюджет.

Здесь вы найдете модные одежду и обувь, электронику и гаджеты, товары для дома и сада, а также уникальные ручные изделия и искусство. Вам даже не придется выходить из дома, чтобы сделать покупки - всё доступно онлайн!

Маркетплейс предоставляет возможность сравнить цены, читать отзывы других покупателей и выбирать самые выгодные предложения. Благодаря удобной системе доставки и надежным способам оплаты, ваш шопинг становится ещё проще и приятнее.''',
            style: TextStyle(height: 1.5),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(AppAssets.uicBanner),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "ver 2.0",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.greyTextColor,
            ),
          )
        ],
      ),
    );
  }
}
