import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/asset_constants.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/recommended_product_section.dart';

class BrandOfTheDayScreen extends StatelessWidget {
  const BrandOfTheDayScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final products = [
      {
        'title': 'Lays Chips',
        'imageUrl':
        'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0'
      },
      {
        'title': 'Pepsi Bottle',
        'imageUrl':
        'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0'
      },
      {
        'title': 'Burger Combo',
        'imageUrl':
        'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0'
      },
      {
        'title': 'Tasty Snacks',
        'imageUrl':
        'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0'
      },
    ];
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Brand of the day',
        trailing: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(AssetConstants.search),
        ),
      ),
      body: SafeArea(
        child: RecommendedProductSection(
          isSmaller: false,
          isFullScreen: true,
          products: products,
        ),
      ),
    );
  }
}
