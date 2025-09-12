
import 'package:bm_user/features/delivery_service/view/widgets/filter_chips.dart';
import 'package:bm_user/features/delivery_service/view/widgets/food_category_card.dart';
import 'package:bm_user/features/delivery_service/view/widgets/food_category_top_bar.dart';
import 'package:bm_user/features/delivery_service/view/widgets/restaurant_card.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../shared/widgets/banner_carousel.dart';

class DeliveryServiceFoodCategoryScreen extends StatefulWidget {
  const DeliveryServiceFoodCategoryScreen({super.key});

  @override
  State<DeliveryServiceFoodCategoryScreen> createState() => _DeliveryServiceFoodCategoryScreenState();
}

class _DeliveryServiceFoodCategoryScreenState extends State<DeliveryServiceFoodCategoryScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> sliderImages = [
      AssetConstants.slider1,
      AssetConstants.slider2,
    ];

    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FoodCategoryTopBar(
                  title: 'Food',
                  location: 'Ponnani, karma road',
                ),
                const SizedBox(height: 15),
                BannerCarousel(sliderImages: sliderImages),
                const SizedBox(height: 10),
                _buildCategoryGrid(),
                const SizedBox(height: 10),
                Text(
                  'Choose your favourite restaurant',
                  style: textBold2XContent18.copyWith(color: primary.shade200),
                ),
                const SizedBox(height: 10),
                const FilterChips(),
                const SizedBox(height: 20),
                _buildRestaurantList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: 300 + index * 100),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 20 * (1 - value)),
                child: child,
              ),
            );
          },
          child: const FoodCategoryCard(title: 'Dosa'),
        );
      },
    );
  }

  Widget _buildRestaurantList(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 1,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: 400 + index * 150),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: Transform.scale(
                scale: value,
                child: child,
              ),
            );
          },
          child: const RestaurantCard(
            imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsPkUEKw5U5p1gy8QF74aS8kT5yrTq1AY-KQ&s',
            title: 'Chicking',
            offer: 'Flat ₹100 OFF above ₹199',
            time: '9 MINS',
            distance: '2.7 km',
            rating: '4.3',
          ),
        );
      },
    );
  }
}
