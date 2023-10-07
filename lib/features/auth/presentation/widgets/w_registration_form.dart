import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_select_category.dart';
import 'package:onlineshop_77/features/auth/presentation/widgets/w_text_field.dart';
import 'package:onlineshop_77/features/common/widgets/gap16.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

import '../../../common/widgets/w_my_products_item.dart';

class WRegistrationForm extends StatefulWidget {
  const WRegistrationForm({
    super.key,
  });

  @override
  State<WRegistrationForm> createState() => _WRegistrationFormState();
}

class _WRegistrationFormState extends State<WRegistrationForm> {
  final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
      mask: '(##) ###-##-##', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);
  final TextEditingController fullNameCtrl = TextEditingController();
  final TextEditingController productNameCtrl = TextEditingController();
  final TextEditingController phoneNumberCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWithTitle(
          onSaved: (value) {
            // widget.getUserData(value, productNameCtrl.text, state.id, phoneNumberCtrl.text, addressCtrl.text);
          },
          controller: fullNameCtrl,
          title: LocaleKeys.fio.tr(),
          hint: LocaleKeys.enterFullName.tr(),
        ),
        const Gap16(),
        TextFieldWithTitle(
          onSaved: (value) {
            // widget.getUserData(fullNameCtrl.text, value, state.id, phoneNumberCtrl.text, addressCtrl.text);
          },
          controller: productNameCtrl,
          title: LocaleKeys.productName.tr(),
          hint: LocaleKeys.enterProductName.tr(),
        ),
        const Gap16(),
        const WSelectCategory(),
        const Gap16(),
        TextFieldWithTitle(
          onSaved: (value) {
            // widget.getUserData(fullNameCtrl.text, productNameCtrl.text, state.id, value, addressCtrl.text);
          },
          controller: phoneNumberCtrl,
          title: LocaleKeys.phoneNumber.tr(),
          keyboardType: TextInputType.number,
          prefix: const Padding(
            padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
            child: Text("+998"),
          ),
          hint: "(__) ___-__-__",
          inputFormatters: [maskFormatter],
        ),
        const Gap16(),
        TextFieldWithTitle(
          onSaved: (value) {
            // widget.getUserData(
            //   fullNameCtrl.text,
            //   productNameCtrl.text,
            //   state.id,
            //   phoneNumberCtrl.text,
            //   value,
            // );
          },
          controller: addressCtrl,
          title: LocaleKeys.address.tr(),
          hint: LocaleKeys.enterAddress.tr(),
        ),
      ],
    );
  }
}
