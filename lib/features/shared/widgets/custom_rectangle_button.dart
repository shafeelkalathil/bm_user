import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRectangleButton extends StatelessWidget {
  const CustomRectangleButton({super.key, this.color, required this.textstyle, required this.text, this.borderRadius = 15, this.onTap,  this.margin = EdgeInsets.zero, });

  final Color? color;
  final TextStyle textstyle;
  final String text;
  final double? borderRadius;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(borderRadius!)),
        ),
        onPressed: onTap,
        child: Text(text, style: textstyle, softWrap: false),
      ),
    );
  }
}