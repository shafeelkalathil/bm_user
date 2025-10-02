import 'package:bm_user/core/constants/color_constants.dart';
import 'package:bm_user/features/home/views/widgets/horizontal_image_section.dart';
import 'package:bm_user/features/home/views/widgets/top_bar.dart';
import 'package:bm_user/features/special_days/views/special_day_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_string_constants.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/providers/location_provider.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../shared/models/product_model.dart';
import '../../shared/widgets/banner_carousel.dart';
import '../../shared/widgets/brand_logo_with_triangle_shape.dart';
import '../../shared/widgets/build_category.dart';
import '../../shared/widgets/custom_search_bar.dart';
import '../../shared/widgets/recommended_product_section.dart';
import '../../shared/widgets/section_title.dart';
import '../../shared/widgets/spot_light_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //-- variables
    final List<String> sliderImages = [AssetConstants.slider1, AssetConstants.slider2];

    final products = <ProductModel>[
      ProductModel(
        quantity: 3,
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
          // ProductVariant(
          //   imageUrl:
          //       'https://images.unsplash.com/photo-1741520149938-4f08654780ef?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          //
          //   quantity: 5,
          //   id: '2',
          //   size: '500',
          //   unit: 'g',
          //   price: 90,
          //   originalPrice: 120,
          //   inStock: true,
          //   discountPercentage: 25,
          // ),
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
        quantity: 7,
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
          // ProductVariant(
          //   quantity: 3,
          //   imageUrl:
          //       'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0',
          //
          //   id: '2',
          //   price: 100,
          //   unit: 'pcs',
          //   inStock: true,
          //   discountPercentage: 10,
          //   originalPrice: 120,
          //   size: "2",
          // ),
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
            size: "25",
            unit: 'pcs',
            price: 50,
            imageUrl:
                'https://images.unsplash.com/photo-1569419915350-4618d98b08f8?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          ProductVariant(
            quantity: 3,
            id: '2',
            size: "25",
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

    return Scaffold(
      body: SafeArea(
        child: Consumer<LocationProvider>(
          builder: (context, locationProvider, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  /// Padded Main Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Top bar
                        TopBar(
                          location: locationProvider.currentAddress ?? 'Location not set',
                          time: '30 Minute',
                        ),
                        const SizedBox(height: 15),

                        /// Search Bar
                        CustomSearchBar(
                          hintText: AppStringConstants.search,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(AssetConstants.search),
                          ),
                        ),
                        const SizedBox(height: 15),

                        /// Banner carousel
                        BannerCarousel(sliderImages: sliderImages),
                        const SizedBox(height: 12),

                        /// Category section
                        const BuildCategoryWidget(),
                        const SizedBox(height: 16),

                        /// Product Highlights
                        SpotlightProducts(products: products),
                        const SizedBox(height: 12),

                        /// Brand Icon Example
                        const SectionTitle(title: 'Popular brands'),
                        const SizedBox(height: 10),
                        const BrandLogoWithTriangleShape(
                          imageUrl:
                              'https://eastern.in/wp-content/uploads/2016/09/cropped-logo-easternapp.png',
                        ),
                        const SizedBox(height: 16),

                        /// Bottom Sections with padding
                        const HorizontalImageSection(title: 'New to the app'),
                      ],
                    ),
                  ),

                  /// Recommended Product Section
                  RecommendedProductSection(isSmaller: false, products: products),
                  const SizedBox(height: 16),

                  /// Bottom Sections with padding
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HorizontalImageSection(
                          title: 'Special days',
                          withBorder: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SpecialDayDetailPage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'India’s ever\nsuper app',
                            style: textExtraBold2XContent36.copyWith(color: primary.shade500),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Created with ❤️ in Kerala,\nbuilt for the world.',
                            style: textBoldContent18.copyWith(color: primary.shade500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
