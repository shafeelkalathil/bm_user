import 'package:bm_user/features/shared/widgets/shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';

class CategoryIconWithTitle extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  const CategoryIconWithTitle({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Column(
          children: [

            SvgPicture.asset(
              icon,
              height: 36,
              fit: BoxFit.cover,
              color: isSelected ? primary.shade500 : null,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: textSemiContent14.copyWith(
                color: isSelected ? primary.shade500 : primary.shade200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
