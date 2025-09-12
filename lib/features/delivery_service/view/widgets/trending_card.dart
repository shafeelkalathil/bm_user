
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth*0.45,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}