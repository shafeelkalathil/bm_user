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
    final List<String> sliderImages = [
      AssetConstants.slider1,
      AssetConstants.slider2,
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
                        BannerCarousel(
                          sliderImages: sliderImages,
                        ),
                        const SizedBox(height: 12),

                        /// Category section
                        const BuildCategoryWidget(),
                        const SizedBox(height: 16),

                        /// Product Highlights
                        const SpotlightProducts(
                          products: [
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
                          ],
                        ),
                        const SizedBox(height: 12),

                        /// Brand Icon Example
                        const SectionTitle(title: 'Popular brands'),
                        const SizedBox(height: 10),
                        const BrandLogoWithTriangleShape(
                            imageUrl:
                            'https://eastern.in/wp-content/uploads/2016/09/cropped-logo-easternapp.png'),
                        const SizedBox(height: 16),

                        /// Bottom Sections with padding
                        const HorizontalImageSection(title: 'New to the app'),
                      ],
                    ),
                  ),

                  /// Recommended Product Section
                  const RecommendedProductSection(
                    isSmaller: false,
                    products: [
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
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// Bottom Sections with padding
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HorizontalImageSection(
                            title: 'Special days', withBorder: true,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SpecialDayDetailPage(),));
                        },),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('India’s ever\nsuper app',style: textExtraBold2XContent36.copyWith(
                            color: primary.shade500
                          ),),
                          const SizedBox(height: 16),
                          Text('Created with ❤️ in Kerala,\nbuilt for the world.',style: textBoldContent18.copyWith(color: primary.shade500),)
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