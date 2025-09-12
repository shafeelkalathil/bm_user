import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';

class Rounded3DButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color color;

  const Rounded3DButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      shadowColor: Colors.black,
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        minWidth: width,
        height: height,
        onPressed: onPressed,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: textExtraBoldContent16.copyWith(
              color: primary.shade200
          ),
        ),
      ),
    );
  }
}
