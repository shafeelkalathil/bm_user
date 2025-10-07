import 'package:flutter/material.dart';
import '../../../core/constants/color_constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    this.margin = EdgeInsets.zero,
    required this.isTransparent,
    this.borderColor,
    this.backGroundColor,
    this.padding = const EdgeInsets.all(0),
    this.borderRadius = 50, this.foregroundColor,
  });

  final EdgeInsetsGeometry? padding,margin;
  final VoidCallback? onPressed;
  final Widget child;
  final double? width, height, borderRadius;
  final bool isTransparent;
  final Color? borderColor,foregroundColor,backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ??EdgeInsets.zero,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 60,
        child: ElevatedButton(
          style: isTransparent
              ? ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 60),
                  backgroundColor: backGroundColor,
                  foregroundColor: foregroundColor,
                  side: BorderSide(color: borderColor ?? primary.shade500, width: 2), // border
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius!),
                  ),
                  padding: padding,
                )
              : null,
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
