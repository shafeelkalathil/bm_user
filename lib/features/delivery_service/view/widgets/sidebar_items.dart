
import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/styles/text_style.dart';

class SidebarItem extends StatelessWidget {
  final String title;
  const SidebarItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        spacing: 4,
        children: [
          CircleAvatar(radius: 25, backgroundColor: primary.shade700,child: const Center(child: Icon(Icons.shopping_basket, color: Colors.orange),)),
          Text(title, style: textSemiContent14.copyWith(color: primary.shade200)),
        ],
      ),
    );
  }
}