import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/core/utils/exports.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_filter_select_item.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_podcategories.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_regions.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_sorts.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WFilterModalSheet extends StatefulWidget {
  const WFilterModalSheet({
    super.key,
  });

  @override
  State<WFilterModalSheet> createState() => _WFilterModalSheetState();
}

class _WFilterModalSheetState extends State<WFilterModalSheet> {
  String groupValue = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: AppConstants.kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ListTile(
            minLeadingWidth: 0,
            title: Text(
              LocaleKeys.filter.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            trailing: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(AppAssets.close)),
          ),
          const Divider(
            height: 0,
            thickness: 1.5,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WRegions(),
                _Gap(),
                WSorts(),
                _Gap(),
                WPodCategories()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: WElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                context
                    .read<SearchBloc>()
                    .add(GetSearchProductsEvent("?region_id=13"));
              },
              child: const Text(
                "Применить фильтр",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Gap extends StatelessWidget {
  const _Gap();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}
