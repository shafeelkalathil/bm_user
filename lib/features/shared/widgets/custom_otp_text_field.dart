import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/constants/color_constants.dart';

class CustomOtpTextFormField extends StatelessWidget {
  CustomOtpTextFormField({super.key,required this.controller, this.validator});
  final TextEditingController controller;
  final String? Function(String?)? validator;

  final cursor = Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Container(
      width: 15,
      height: 4,
      color: primary.shade500,
    ),
  );

  final defaultPinTheme = PinTheme(
    width: 60,
    height: 60,
    textStyle: const TextStyle(fontSize: 18),
    decoration: BoxDecoration(
      color: const Color(0xffF0F0F0),
      border: Border.all(color: primary.shade400),
      borderRadius: BorderRadius.circular(15),
    ),
  );
  final focusedPinTheme = PinTheme(
    width: 60,
    height: 60,
    textStyle: const TextStyle(fontSize: 18),
    decoration: BoxDecoration(
      border: Border.all(color: primary.shade400),
      borderRadius: BorderRadius.circular(15),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      focusedPinTheme: focusedPinTheme,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => const SizedBox(width: 35),
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      onChanged: (String code) {
      },
      pinAnimationType: PinAnimationType.none,
      showCursor: true,
      controller: controller,
      cursor: cursor,
      validator: validator,
    );
  }
}