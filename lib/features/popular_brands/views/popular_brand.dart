import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/shared/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_string_constants.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../delivery_service/view/widgets/trending_card.dart';
import '../../shared/widgets/custom_rounded_back_button.dart';
import '../../shared/widgets/product_card_with_add_button.dart';

class PopularBrandScreen extends StatefulWidget {
  const PopularBrandScreen({super.key});

  @override
  State<PopularBrandScreen> createState() => _PopularBrandScreenState();
}

class _PopularBrandScreenState extends State<PopularBrandScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final products = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: context.screenHeight * 0.3,
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate how much the app bar has collapsed
                final expandedHeight = context.screenHeight * 0.4;
                final minHeight = kToolbarHeight + MediaQuery.of(context).padding.top;
                final currentHeight = constraints.maxHeight;
                final collapsedFraction = ((expandedHeight - currentHeight) / (expandedHeight - minHeight)).clamp(0.0, 1.0);

                return FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Background Hero Image
                      Hero(
                        tag: 'popular_brand_hero',
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          child: Image.asset(
                            AssetConstants.popularBrand,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),



                      // Back Button
                      Positioned(
                        left: 15,
                        top: MediaQuery.of(context).padding.top + 10,
                        child: const CustomBackButton(),
                      ),


                      // Search Bar at Bottom
                      Positioned(
                        left: 15,
                        right: 15,
                        bottom: 20,
                        child: AnimatedOpacity(
                          opacity: 1.0 - collapsedFraction,
                          duration: const Duration(milliseconds: 200),
                          child: CustomSearchBar(
                            controller: _searchController,
                            hintText: AppStringConstants.search,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(AssetConstants.search),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

