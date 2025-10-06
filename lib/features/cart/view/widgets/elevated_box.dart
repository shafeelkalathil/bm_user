import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/styles/text_style.dart';

class ElevatedBox extends StatelessWidget {
  const ElevatedBox({super.key, required this.title, required this.time, required this.description});

  final String title,time,description;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: context.screenWidth*0.3,
        height: 80,
        decoration: BoxDecoration(
          color: primary.shade300,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // spacing: 5,
          children: [
            Text(
              title,
              style: textExtraBoldContent12.copyWith(
                  color: primary.shade200
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              time,
              style: textSemiContent12.copyWith(
                  color: primary.shade200
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              description,
              style: textSemiContent8.copyWith(
                  color: primary.shade200
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}