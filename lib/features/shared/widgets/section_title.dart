import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: textExtraBoldContent14.copyWith(color: primary.shade200));
  }
}