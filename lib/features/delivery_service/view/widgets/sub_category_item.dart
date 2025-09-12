
import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/styles/text_style.dart';
import '../delivery_service_sub_category_detail.dart';

class SubCategoryItem extends StatelessWidget {
  final String title;
  const SubCategoryItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DeliverServiceSubCategoryDetailScreen(title: title),));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.22,
        child: Column(
          children: [
            Container(
              height: 90,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.category, color: Colors.red),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: textSemiContent12.copyWith(color: primary.shade200),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}