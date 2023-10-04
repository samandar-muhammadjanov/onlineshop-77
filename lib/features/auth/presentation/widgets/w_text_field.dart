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
          style: const TextStyle(
            color: AppConstants.kDarkGreyColor,
            fontWeight: FontWeight.w500,
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
          style: const TextStyle(fontSize: 14),
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            hintText: hint,
            prefixIconConstraints: BoxConstraints.tight(
              const Size(55, 50),
            ),
            fillColor: AppConstants.kBackgroundColor,
            prefixIcon: prefix,
            hintStyle: const TextStyle(color: AppConstants.kHintColor),
            filled: true,
            suffixIcon: suffix,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppConstants.kPrimaryColor),
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
