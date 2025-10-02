import 'package:bm_user/core/common_variables.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/shared/widgets/custom_elevated_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../shared/models/product_model.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/product_card_with_add_button.dart';
import '../../shared/widgets/rounded_button_3d_effect.dart';
import '../../shared/widgets/section_title.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
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

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cart',
        trailing: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(AssetConstants.search),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //-- checking cart products are empty or not
              Center(
                child: Column(
                  spacing: 15,
                  children: [
                    Image(
                      image: AssetImage(AssetConstants.emptyCart),
                      width: context.screenWidth * 0.5,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Uh! You don’t have any orders yet ',
                      style: textBoldContent14.copyWith(fontSize: 15, color: primary.shade50),
                    ),
                    Rounded3DButton(
                      text: "Order now",
                      onPressed: () {},
                      width: context.screenWidth * 0.55,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              const SectionTitle(title: 'Complete your meal'),
              const SizedBox(height: 10),

              GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (_, index) => ProductCardWithAddButton(
                  singleProduct: products[index],
                  // imageUrl: products[index]['imageUrl']!,
                  // title: products[index]['title']!,
                  // price: '525',
                  // time: '8 min',
                  // subTitle: 'Ashirvad 0% maida, 100% mp atta',
                  // offerPer: '12',
                  // itemQty: '1 kg',
                  onTap: () {},
                  productWithOption: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
