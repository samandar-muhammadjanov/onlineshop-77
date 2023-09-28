import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_text_field.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class WPrice extends StatefulWidget {
  const WPrice({
    super.key,
    required this.getPrice,
    required this.formKey,
  });
  final Function(int, String) getPrice;
  final GlobalKey<FormState> formKey;
  @override
  State<WPrice> createState() => _WPriceState();
}

class _WPriceState extends State<WPrice> {
  List items = ["UZS", "USD"];
  String price = '0';
  String _dropdownValue = "UZS";
  void _dropdownCallback(String? selectedValue) {
    setState(() {
      _dropdownValue = selectedValue!;
    });
    widget.getPrice(int.parse(price), _dropdownValue == "UZS" ? "uzs" : "usd");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppConstants.kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.price.tr(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          WTextField(
            validator: (value) {
              if (value!.isEmpty) {
                return "*required";
              }
              return null;
            },
            onFieldSubmitted: (value) {
              price = value;
              widget.getPrice(
                  int.parse(price), _dropdownValue == "UZS" ? "uzs" : "usd");
              setState(() {});
            },
            title: LocaleKeys.price.tr(),
            hint: LocaleKeys.enterPrice.tr(),
            suffix: Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffD6D6D6).withOpacity(0.5),
              ),
              child: DropdownButton<String>(
                value: _dropdownValue,
                underline: const SizedBox(),
                icon: SvgPicture.asset(AppAssets.chevronDown),
                borderRadius: BorderRadius.circular(15),
                dropdownColor: const Color(0xffD6D6D6).withOpacity(0.5),
                elevation: 0,
                items: const [
                  DropdownMenuItem(
                    value: "UZS",
                    child: Text("UZS"),
                  ),
                  DropdownMenuItem(
                    value: "USD",
                    child: Text("USD"),
                  ),
                ],
                onChanged: _dropdownCallback,
              ),
            ),
          )
        ],
      ),
    );
  }
}
