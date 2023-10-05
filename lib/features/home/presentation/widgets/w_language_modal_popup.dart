import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/storage/store_keys.dart';
import 'package:onlineshop_77/core/storage/storage_repository.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_elevated_button.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_divider.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_selected_item.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_modal_sheet_scroller.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';
import 'package:restart_app/restart_app.dart';

class WLanguageModalPopup extends StatefulWidget {
  const WLanguageModalPopup({super.key});

  @override
  State<WLanguageModalPopup> createState() => _WLanguageModalPopupState();
}

class _WLanguageModalPopupState extends State<WLanguageModalPopup> {
  late String groupValue;
  @override
  void initState() {
    groupValue =
        StorageRepository.getString(StoreKeys.language, defValue: "uz");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const WModalSheetScroller(),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: AppConstants.kWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  LocaleKeys.selectLanguage.tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                trailing: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(AppAssets.close)),
              ),
              const WDivider(),
              WSelectItem(
                  groupValue: groupValue,
                  onTap: (value) {
                    groupValue = value;
                    setState(() {});
                  },
                  title: "O’zbekcha",
                  value: "uz"),
              const WDivider(),
              WSelectItem(
                  groupValue: groupValue,
                  onTap: (value) {
                    groupValue = value;
                    setState(() {});
                  },
                  title: "Русский",
                  value: "ru"),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: WElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale(groupValue));
                    StorageRepository.putString(StoreKeys.language, groupValue);
                    Navigator.pop(context);
                    Restart.restartApp();
                  },
                  child: Text(
                    LocaleKeys.select.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
