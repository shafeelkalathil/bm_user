import 'package:flutter/material.dart';
import 'category_item.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
    required this.categories,
    required this.categoryImages,
  });

  final List<String> categories;
  final List<String> categoryImages;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemCount: categories.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CategoryItem(title: categories[index],imageUrl: categoryImages[index],);
      },
    );
  }
}