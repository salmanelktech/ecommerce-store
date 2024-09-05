
import 'package:eshop/src/app/presentation/theme/color_theme.dart';
import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.hintText,
    this.validator,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    this.autofillHints,
    this.suffixIcon = const SizedBox(),
    this.preffixIcon,
    this.maxLength,
    this.maxLine,
    this.fieldTitle,
    this.isFilled,
    this.isReadOnly =false,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final bool autofocus;
  final TextInputType keyboardType;
  final Iterable<String>? autofillHints;
  final Widget suffixIcon;
  final Widget? preffixIcon;
  final int? maxLength;
  final int? maxLine;
  final String? fieldTitle;
  final bool? isFilled;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fieldTitle != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  fieldTitle.toString(),
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            : const SizedBox(),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          autofocus: autofocus,
          obscureText: obscureText,
          autofillHints: autofillHints,
          maxLength: maxLength,
          maxLines: maxLine,
          cursorColor: kBlackColor,
          readOnly: isReadOnly,
          decoration: InputDecoration(
            fillColor: const Color(0xFFEEEEEE),
            filled:isFilled == true?  true: false,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: kPrimaryColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: kPrimaryColor)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: kRedColor)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: kRedColor)),
            hintText: hintText,
            prefixIcon: preffixIcon,
            suffixIcon: suffixIcon,
            hintStyle: const TextStyle(
                fontWeight: FontWeight.w400, color: kBlackColor, fontSize: 14),
          ),
          style: const TextStyle(
              fontWeight: FontWeight.w400, color: kBlackColor, fontSize: 14),
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
