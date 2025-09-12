import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/styles/text_style.dart';

class ElevatedIconBox extends StatelessWidget {
  final String imageUrl;
  final String label;

  const ElevatedIconBox({
    super.key,
    required this.imageUrl,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 60,
        height: 55,
        decoration: BoxDecoration(
          color: primary.shade300,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imageUrl),
            Text(
              label,
              style: textExtraBoldContent10.copyWith(
                  fontSize: 8,
                  color: primary.shade200
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}