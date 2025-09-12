import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/delivery_service/view/widgets/sub_category_grid.dart';
import 'package:bm_user/features/delivery_service/view/widgets/trending_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../shared/widgets/brand_logo_with_triangle_shape.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/section_title.dart';
import '../../shared/widgets/spot_light_products.dart';

class DeliveryServiceSubCategories extends StatelessWidget {
  const DeliveryServiceSubCategories({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final subcategories = [
      'Atta, rice & pea',
      'Dairy & egg',
      'Vegetables',
      'Meat & seafood',
      'Fruits',
      'Oil & ghee',
      'Noodles, batter & pasta',
      'Sauces & spreads',
      'Tea, coffee & whitener',
      'Vermicelli & oats',
      'Masala, pickle & sugar',
      'Cleaning essentials',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: categoryName,
        trailing: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(AssetConstants.search),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSubCategorySection(context, subcategories),
            _buildBanner(context),
            const SizedBox(height: 20),
            const Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpotlightProducts(products: _sampleProducts),
                  SizedBox(height: 20),
                  SectionTitle(title: "Trending near you"),
                  SizedBox(height: 12),
                  _TrendingList(),
                  SizedBox(height: 20),
                  SectionTitle(title: "Popular brands"),
                  SizedBox(height: 12),
                  _BrandRow(),
                  SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSubCategorySection(
      BuildContext context, List<String> subcategories) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text("Categories",
              style: textExtraBold3XContent14.copyWith(
                  color: primary.shade200, fontSize: 15)),
          const SizedBox(height: 12),
          SubCategoryGrid(subcategories: subcategories),
        ],
      ),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeIn,
      child: Image.asset(
        AssetConstants.slider2,
        fit: BoxFit.cover,
        width: context.screenWidth,
        height: 215,
      ),
    );
  }
}

/// Trending horizontal list with animation
class _TrendingList extends StatelessWidget {
  const _TrendingList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) => AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(milliseconds: 300 + index * 200),
          child: const TrendingCard(
            imageUrl:
                "https://media.istockphoto.com/id/1829241109/photo/enjoying-a-brunch-together.jpg?s=612x612&w=0&k=20&c=9awLLRMBLeiYsrXrkgzkoscVU_3RoVwl_HA-OT-srjQ=",
          ),
        ),
      ),
    );
  }
}

/// Brand logo row
class _BrandRow extends StatelessWidget {
  const _BrandRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        4,
        (index) => const Padding(
          padding: EdgeInsets.only(right: 12),
          child: BrandLogoWithTriangleShape(
            imageUrl:
                'https://eastern.in/wp-content/uploads/2016/09/cropped-logo-easternapp.png',
          ),
        ),
      ),
    );
  }
}

/// Mock product list
const List<Map<String, String>> _sampleProducts = [
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
