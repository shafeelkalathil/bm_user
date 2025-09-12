
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/delivery_service/view/widgets/filter_chips.dart';
import 'package:bm_user/features/delivery_service/view/widgets/sidebar_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../cart/view/view_cart_screen.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/custom_elevated_button.dart';
import '../../shared/widgets/product_card_with_add_button.dart';
import '../../shared/widgets/recommended_product_section.dart';

class DeliverServiceSubCategoryDetailScreen extends StatelessWidget {
  final String title;
  const DeliverServiceSubCategoryDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final categories = List.generate(8, (index) => "Atta");
    final products = _mockProducts();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: title,
        trailing: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(AssetConstants.search),
        ),
      ),
      body: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSidebar(categories),
              Expanded(child: _buildMainContent(context, products)),
            ],
          ),
          _buildViewCartButton(context)
        ],
      ),
    );
  }

  /// Sidebar for vertical category chips
  Widget _buildSidebar(List<String> categories) {
    return SizedBox(
      width: 60,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) => SidebarItem(title: categories[index]),
      ),
    );
  }

  /// Main product and filter chip view
  Widget _buildMainContent(BuildContext context, List<Map<String, String>> products) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FilterChips(),
          const SizedBox(height: 12),
          RecommendedProductSection(isSmaller: true, products: products),
          const SizedBox(height: 12),
          _buildHorizontalProductList(context, products),
        ],
      ),
    );
  }

  /// Horizontal list of products with Add button
  Widget _buildHorizontalProductList(BuildContext context, List<Map<String, String>> products) {
    return SizedBox(
      height: context.screenHeight * 0.28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) => ProductCardWithAddButton(
          isBg: false,
          imageUrl: products[index]['imageUrl']!,
          title: products[index]['title']!,
          price: '525',
          time: '8 min',
          subTitle: 'Ashirvad 0% maida, 100% mp atta',
          offerPer: '12',
          itemQty: '1 kg',
          onTap: () {},
          productWithOption: true,
        ),
      ),
    );
  }

  /// Floating View Cart Button
  Widget _buildViewCartButton(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: context.screenWidth * 0.25,
      right: context.screenWidth * 0.25,
      child: CustomElevatedButton(
        isTransparent: false,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ViewCartScreen()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('View cart'),
            Icon(Icons.arrow_forward_ios, color: primary.shade300),
          ],
        ),
      ),
    );
  }

  /// Mock product list for demonstration
  List<Map<String, String>> _mockProducts() => [
    {
      'title': 'Lays Chips',
      'imageUrl': 'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80'
    },
    {
      'title': 'Pepsi Bottle',
      'imageUrl': 'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80'
    },
    {
      'title': 'Burger Combo',
      'imageUrl': 'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80'
    },
    {
      'title': 'Tasty Snacks',
      'imageUrl': 'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80'
    },
  ];
}
