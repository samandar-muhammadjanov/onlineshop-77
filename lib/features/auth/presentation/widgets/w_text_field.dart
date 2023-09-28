import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/assets/constants/constants.dart';

class WTextField extends StatefulWidget {
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
  State<WTextField> createState() => _WTextFieldState();
}

class _WTextFieldState extends State<WTextField> {
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: AppConstants.kDarkGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          onSaved: widget.onSaved,
          readOnly: widget.readOnly ?? false,
          obscureText: widget.obscureText ?? false,
          controller: widget.controller,
          onFieldSubmitted: (value) {
            widget.onFieldSubmitted;
            setState(() {
              isFocused = false;
            });
          },
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          style: const TextStyle(fontSize: 14),
          onTap: () => setState(() {
            isFocused = true;
          }),
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
            setState(() {
              isFocused = false;
            });
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            hintText: widget.hint,
            prefixIconConstraints: BoxConstraints.tight(
              const Size(55, 50),
            ),
            prefixIcon: widget.prefix,
            hintStyle: const TextStyle(color: AppConstants.kHintColor),
            filled: !isFocused,
            fillColor: AppConstants.kBackgroundColor,
            suffixIcon: widget.suffix,
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
