import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;
  final double? width, height;
  final Color bgColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  const ShadowContainer({
    this.borderRadius = 15,
    super.key,
    this.padding = const EdgeInsets.all(10),
    this.margin = const EdgeInsets.all(10),
    required this.child,
    this.width,
    this.height,
    this.bgColor = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      padding: padding,
      child: child,
    );
  }
}
