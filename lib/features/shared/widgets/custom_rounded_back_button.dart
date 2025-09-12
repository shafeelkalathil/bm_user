import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onPressed,
    this.size = 40,
    this.iconSize = 20,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.shadowColor,
    this.elevation = 4,
  });

  final VoidCallback? onPressed;
  final double size;
  final double iconSize;
  final Color backgroundColor;
  final Color iconColor;
  final Color? shadowColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.black.withOpacity(0.15),
            blurRadius: elevation * 2,
            offset: Offset(0, elevation / 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(size / 2),
          onTap: onPressed ?? () => Navigator.pop(context),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios,
              size: iconSize,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
