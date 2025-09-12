import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/styles/text_style.dart';
import '../delivery_service_sub_category_detail.dart';

class FoodCategoryCard extends StatelessWidget {
  const FoodCategoryCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DeliverServiceSubCategoryDetailScreen(title: title),
        ),
      ),
      child: Column(
        spacing: 5,
        children: [
          Material(
            elevation: 6,
            shadowColor: Colors.black26,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: primary.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(5),
              child: const Icon(Icons.shopping_basket, color: Colors.orange),
            ),
          ),
          Text(title, style: textSemiContent10.copyWith(color: primary.shade200)),
        ],
      ),
    );
  }
}