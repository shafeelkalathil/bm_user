import 'package:bm_user/core/constants/asset_constants.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/custom_rounded_back_button.dart';
import '../../shared/widgets/product_card_with_add_button.dart';

class SpecialDayDetailPage extends StatefulWidget {
  const SpecialDayDetailPage({super.key});

  @override
  State<SpecialDayDetailPage> createState() => _SpecialDayDetailPageState();
}

class _SpecialDayDetailPageState extends State<SpecialDayDetailPage> {

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

  @override
  Widget build(BuildContext context) {
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
                    tag: 'https://images.unsplash.com/photo-1585768750637-ada36319a484?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      child: Image.asset(
                        AssetConstants.valantiesSale,fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: context.screenHeight * 0.05,
                    child: CustomBackButton(),
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
                  SectionTitle(title: 'To buy'),
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
}
