import 'package:bm_user/features/delivery_service/view/widgets/sub_category_item.dart';
import 'package:flutter/cupertino.dart';

class SubCategoryGrid extends StatelessWidget {
  const SubCategoryGrid({
    super.key,
    required this.subcategories,
  });

  final List<String> subcategories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.68,
      ),
      shrinkWrap: true,
      itemCount: subcategories.length,
      itemBuilder: (context, index) {
        return SubCategoryItem(title: subcategories[index]);
      },
    );
  }
}