import 'package:flutter/material.dart';
import '../../../core/constants/color_constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    required this.isTransparent,
    this.borderColor, this.borderRadius,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final double? width, height,borderRadius;
  final bool isTransparent;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 60,
      child: ElevatedButton(
        style: isTransparent
            ? ElevatedButton.styleFrom(
                backgroundColor: primary.shade300,
                foregroundColor: primary.shade500,
                side: BorderSide(color: borderColor ?? primary.shade500, width: 2), // border
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 50),
                ),
          padding: EdgeInsets.zero
              )
            : null,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
