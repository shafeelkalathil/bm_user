import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/color_constants.dart';

class CircularIcon extends StatelessWidget {
  final String svgPath;
  const CircularIcon({super.key, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: primary.shade600, width: 2.0),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(svgPath, width: 15, height: 15),
    );
  }
}