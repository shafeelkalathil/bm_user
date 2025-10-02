import 'package:bm_user/core/constants/asset_constants.dart';
import 'package:bm_user/core/constants/color_constants.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/core/utils/styles/text_style.dart';
import 'package:bm_user/features/delivery_service/view/widgets/sub_category_grid.dart';
import 'package:bm_user/features/delivery_service/view/widgets/trending_card.dart';
import 'package:bm_user/features/shared/widgets/brand_logo_with_triangle_shape.dart';
import 'package:bm_user/features/shared/widgets/custom_app_bar.dart';
import 'package:bm_user/features/shared/widgets/section_title.dart';
import 'package:bm_user/features/shared/widgets/spot_light_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bm_user/features/shared/models/product_model.dart';

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
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 15),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubCategorySection(BuildContext context, List<String> subcategories) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            "Categories",
            style: textExtraBold3XContent14.copyWith(color: primary.shade200, fontSize: 15),
          ),
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
final _sampleProducts = [
  ProductModel(
    quantity: 8,
    name: 'Lays Chips',
    imageUrl:
        'https://images.unsplash.com/photo-1741520149938-4f08654780ef?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    category: 'Snacks',
    hasMultipleOptions: true,

    id: '',
    brand: 'Lays',
    description: '',
    rating: 4.5,
    reviewCount: 10,
    variants: [
      ProductVariant(
        quantity: 3,
        imageUrl:
            'https://images.unsplash.com/photo-1741520149938-4f08654780ef?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        id: '1',
        size: '200',
        unit: 'g',
        price: 40,
        originalPrice: 50,
        inStock: true,
        discountPercentage: 20,
      ),
      ProductVariant(
        imageUrl:
            'https://images.unsplash.com/photo-1741520149938-4f08654780ef?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

        quantity: 5,
        id: '2',
        size: '500',
        unit: 'g',
        price: 90,
        originalPrice: 120,
        inStock: true,
        discountPercentage: 25,
      ),
    ],
  ),
  ProductModel(
    quantity: 12,
    name: 'Pepsi Bottle',
    imageUrl:
        'https://images.unsplash.com/photo-1629203849820-fdd70d49c38e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

    category: 'Drinks',
    variants: [
      ProductVariant(
        quantity: 4,
        imageUrl:
            'https://images.unsplash.com/photo-1629203849820-fdd70d49c38e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

        id: '1',
        size: '400',
        unit: 'ml',
        price: 30,
        originalPrice: 35,
        discountPercentage: 10,
        inStock: true,
      ),
      ProductVariant(
        quantity: 8,
        imageUrl:
            'https://images.unsplash.com/photo-1629203849820-fdd70d49c38e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

        id: '2',
        size: '800',
        unit: 'ml',
        price: 60,
        originalPrice: 70,
        discountPercentage: 10,
        inStock: true,
      ),
    ],
    id: '',
    brand: '',
    description: '',
    rating: 4.3,
    reviewCount: 20,
  ),
  ProductModel(
    quantity: 10,
    name: 'Burger Combo',
    imageUrl:
        'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0',

    variants: [
      ProductVariant(
        quantity: 7,
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0',

        id: '1',
        price: 60,
        unit: 'pcs',
        inStock: true,
        discountPercentage: 10,
        originalPrice: 80,
        size: '1',
      ),
      ProductVariant(
        quantity: 3,
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0',

        id: '2',
        price: 100,
        unit: 'pcs',
        inStock: true,
        discountPercentage: 10,
        originalPrice: 120,
        size: "2",
      ),
    ],
    category: 'Food',

    brand: 'McDonalds',
    description: 'Delicious burger combo with fris and drinks',
    id: '',
    rating: 4.0,
    reviewCount: 35,
    hasMultipleOptions: true,
  ),
  ProductModel(
    quantity: 5,
    name: 'Tasty Snacks',
    imageUrl:
        'https://images.unsplash.com/photo-1569419915350-4618d98b08f8?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    category: 'Snacks',
    variants: [
      ProductVariant(
        quantity: 2,
        id: '1',
        size: "2",
        unit: 'pcs',
        price: 50,
        imageUrl:
            'https://images.unsplash.com/photo-1569419915350-4618d98b08f8?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      ProductVariant(
        quantity: 3,
        id: '2',
        size: "1",
        unit: 'pcs',
        price: 70,
        imageUrl:
            'https://images.unsplash.com/photo-1569419915350-4618d98b08f8?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
    ],
    id: '',
    brand: 'Snacky',
    description: "Assorted tasty snacks",
    rating: 4.2,
    reviewCount: 15,
    hasMultipleOptions: true,
  ),
];
