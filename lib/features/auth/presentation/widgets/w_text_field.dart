import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/core/utils/extentions.dart';
import '/assets/constants/constants.dart';

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle(
      {super.key,
      required this.title,
      this.hint,
      this.controller,
      this.prefix,
      this.inputFormatters,
      this.keyboardType,
      this.maxLines,
      this.suffix,
      this.validator,
      this.obscureText,
      this.readOnly,
      this.onFieldSubmitted,
      this.onSaved,
      this.onChanged});

  final String title;
  final String? hint;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool? readOnly;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onSaved;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.darkGreyColor,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          onChanged: onChanged,
          onSaved: onSaved,
          readOnly: readOnly ?? false,
          obscureText: obscureText ?? false,
          controller: controller,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textCapitalization: TextCapitalization.words,
          style: context.textTheme.bodySmall!,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            hintText: hint,
            prefixIconConstraints: BoxConstraints.tight(
              const Size(55, 50),
            ),
            fillColor: AppColors.backgroundColor,
            hintStyle: const TextStyle(color: AppColors.hintColor),
            filled: true,
            prefixIcon: prefix,
            suffixIcon: suffix,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        )
      ],
    );
  }
}
