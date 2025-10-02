import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/shared/models/product_model.dart';
import 'package:bm_user/features/shared/widgets/product_card_with_fav_icon.dart';
import 'package:bm_user/features/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';

class SpotlightProducts extends StatelessWidget {
  const SpotlightProducts({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Spot Light'),
        const SizedBox(height: 12),
        SizedBox(
          height: context.screenHeight * 0.2,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, index) => ProductCardWithFavIcon(
              imageUrl: products[index].imageUrl,
              title: products[index].name,
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
