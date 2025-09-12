import 'package:bm_user/features/delivery_service/view/widgets/filter_chips.dart';
import 'package:bm_user/features/delivery_service/view/widgets/food_category_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/extensions/size_extension.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../shared/widgets/product_card_with_add_button.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String restaurantTitle;

  const RestaurantDetailScreen({
    super.key,
    required this.imageUrl,
    required this.restaurantTitle,
  });

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: context.screenHeight * 0.4,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(context.screenWidth * 0.15),
                        bottomRight: Radius.circular(context.screenWidth * 0.15),
                      ),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    right: 15,
                    top: context.screenHeight * 0.05,
                    child: FoodCategoryTopBar(
                      title: 'Food',
                      location: 'Ponnani, karma road',
                      primaryColor: primary.shade300,
                      secondaryColor: primary.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopDetails(restaurantTitle),
                  const SizedBox(height: 10),
                  Divider(thickness: 2, color: primary.shade700),
                  const SizedBox(height: 10),
                  _buildOfferRow(),
                  const SizedBox(height: 10),
                  Divider(thickness: 6, color: primary.shade700),
                  const SizedBox(height: 10),
                  const FilterChips(),
                  const SizedBox(height: 10),
                  _buildFlashSaleBanner(),
                  const SizedBox(height: 10),
                  GridView.builder(
                    itemCount: products.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (_, index) => ProductCardWithAddButton(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopDetails(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: textBold2XContent18.copyWith(color: primary.shade200)),
            const SizedBox(height: 6),
            Row(
              children: [
                SvgPicture.asset(AssetConstants.timer),
                const SizedBox(width: 5),
                Text(
                  '8 MNS · 27 km · Kottakkal',
                  style: textExtraBoldContent6.copyWith(color: primary.shade50),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: primary.shade500,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text('4.2', style: textBoldContent10.copyWith(fontSize: 11, color: primary.shade300)),
              const SizedBox(width: 4),
              SvgPicture.asset(AssetConstants.starWhite),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOfferRow() {
    return Row(
      children: [
        SvgPicture.asset(AssetConstants.coupon),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            'Flat ₹100 OFF above orders of ₹500',
            style: textSemiContent8.copyWith(color: primary.shade200, fontSize: 9),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildFlashSaleBanner() {
    return Row(
      children: [
        SvgPicture.asset(AssetConstants.flash),
        const SizedBox(width: 10),
        Text('Flash Sale Ends at 3 PM', style: textBold2XContent18.copyWith(color: primary.shade200)),
      ],
    );
  }
}