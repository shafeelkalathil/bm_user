import 'package:bm_user/features/delivery_service/view/widgets/trending_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/asset_constants.dart';
import '../../shared/widgets/category_grid.dart';
import '../../shared/widgets/custom_app_bar.dart';

class DeliveryServiceScreen extends StatelessWidget {
  const DeliveryServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Daily need',
      'Food',
      'Bakery & drinks',
      'Beauty & personal care',
      'Stationary & games',
      'Dry fruits & nuts',
      'Household & repellents',
      'Medicine',
      'Sports room',
      'Electronics',
      'Hardware',
      'Auto mobiles',
      'Fashion',
      'Courier',
      'Fertilizers & plants',
      'Pets',
    ];

    final categoryImages = [
      AssetConstants.dailyNeed,
      AssetConstants.food,
      AssetConstants.bakeryAndDrink,
      AssetConstants.beauty_and_personal_care,
      AssetConstants.stationaryAndGames,
      AssetConstants.dry_fruts,
      AssetConstants.households,
      AssetConstants.medicine,
      AssetConstants.sports_room,
      AssetConstants.electronics,
      AssetConstants.hardware,
      AssetConstants.auto_mobiles,
      AssetConstants.fashion,
      AssetConstants.courier,
      AssetConstants.fertilizer,
      AssetConstants.pets
    ];


    return Scaffold(
      appBar: CustomAppBar(
        title: 'Delivery service',
        trailing: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(AssetConstants.search),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Category Grid Section
            CategoryGrid(categories: categories,categoryImages: categoryImages,),

            const SizedBox(height: 20),

            /// Offer Banners Section with optional animation
            const _AnimatedOfferList(),
          ],
        ),
      ),
    );
  }
}

/// Trending Offers with Fade-In Placeholder Animation
class _AnimatedOfferList extends StatelessWidget {
  const _AnimatedOfferList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return const AnimatedOpacity(
            duration: Duration(milliseconds: 600),
            opacity: 1.0,
            curve: Curves.easeIn,
            child: TrendingCard(
              imageUrl:
              'https://media.istockphoto.com/id/1829241109/photo/enjoying-a-brunch-together.jpg?s=612x612&w=0&k=20&c=9awLLRMBLeiYsrXrkgzkoscVU_3RoVwl_HA-OT-srjQ=',
            ),
          );
        },
      ),
    );
  }
}
