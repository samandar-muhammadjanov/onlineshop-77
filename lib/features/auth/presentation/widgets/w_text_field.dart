import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/assets/constants/constants.dart';

class WTextField extends StatelessWidget {
  const WTextField(
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
      this.onSaved});
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppConstants.kDarkGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          onSaved: onSaved,
          readOnly: readOnly ?? false,
          obscureText: obscureText ?? false,
          controller: controller,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            hintText: hint,
            prefixIconConstraints: BoxConstraints.tight(
              const Size(55, 50),
            ),
            prefixIcon: prefix,
            hintStyle: const TextStyle(color: AppConstants.kHintColor),
            filled: true,
            fillColor: AppConstants.kBackgroundColor,
            suffixIcon: suffix,
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
