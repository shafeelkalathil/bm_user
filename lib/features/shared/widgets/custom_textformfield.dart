import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants/color_constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.validator,
    this.keyboardType,
    this.controller,
    this.hintText,
    this.prefix,
    this.maxLength,
    this.inputFormatters
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? prefix;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(hintText: hintText, prefix: prefix,counterText: ''),
      // style: textExtraBoldContent16.copyWith(color: primary.shade200),
      cursorColor: primary.shade500,
      maxLength: maxLength,
      inputFormatters: inputFormatters,

    );
  }
}
