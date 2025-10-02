import 'package:bm_user/core/common_variables.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/cart/view/widgets/elevated_box.dart';
import 'package:bm_user/features/cart/view/widgets/elevated_icon_box.dart';
import 'package:bm_user/features/cart/view/widgets/selectable_chip_row.dart';
import 'package:bm_user/features/cart/view/widgets/slidetopay_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_string_constants.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../shared/models/product_model.dart';
import '../../shared/widgets/custom_elevated_button.dart';
import '../../shared/widgets/product_card_with_add_button.dart';
import '../../shared/widgets/section_title.dart';
import '../../shared/widgets/shadow_container.dart';
import 'order_confirmation_screen.dart';

class ViewCartScreen extends ConsumerStatefulWidget {
  const ViewCartScreen({super.key});

  @override
  ConsumerState<ViewCartScreen> createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends ConsumerState<ViewCartScreen> {

  final amountToPay  = StateProvider((ref) => 0.0);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      for(var a in cartProducts){
        ref.watch(amountToPay.notifier).state += a.productPrice * a.quantity;
      }
    },);

  }

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

    final List<String> deliveryInstructionsText = [
      AppStringConstants.avoidRingingBell,
      AppStringConstants.leaveAtTheDoor,
      AppStringConstants.directionToReach,
      AppStringConstants.leaveWithSecurity,
      AppStringConstants.avoidCalling,
    ];
    final List<String> deliveryInstructionsIcon = [
      AssetConstants.bell,
      AssetConstants.leaveAtDoor,
      AssetConstants.locationGrey,
      AssetConstants.security,
      AssetConstants.phone,
    ];

    final List<String> contentTitle = ['Lightning ', 'Eco saver', 'SHEDULE YOUR ORDER'];
    final List<String> contentTime = ['20-25 mins', '30-35 mins', ''];
    final List<String> contentDescription = ['Appreciate your delivery', 'Appreciate your delivery', 'Select your date & time'];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //--  add button at the top right
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SectionTitle(title: 'Review items'),
                  CustomElevatedButton(
                    width: 46,
                    height: 25,
                    onPressed: () {},
                    isTransparent: true,
                    borderColor: primary.shade600,
                    child: Text('Add', style: textSemiContent14.copyWith(color: primary.shade200)),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              //-- list of cart items
              ListView.separated(
                itemCount: cartProducts.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ShadowContainer(
                    child: Row(
                      spacing: 10,
                      children: [
                        //-- image of the product
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(12)),
                          child: cartProducts[index].productImage.isEmpty
                              ? const Icon(Icons.shopping_basket, color: Colors.orange)
                              : CachedNetworkImage(imageUrl: cartProducts[index].productImage),
                        ),

                        //-- product name and weight info
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 10,
                            children: [
                              //--  product name
                              Text(cartProducts[index].productName, style: textSemiContent14.copyWith(color: primary.shade200)),
                              SizedBox(
                                width: context.screenWidth * 0.35,
                                child: Row(
                                  spacing: 6,
                                  children: [
                                    //-- product weight
                                    _buildTag(
                                      text:
                                          '${cartProducts[index].size} ${cartProducts[index].unit}',
                                      width: 45,
                                    ),

                                    //-- product description
                                    Expanded(
                                      child: _buildTag(
                                        text: cartProducts[index].productDescription,
                                        width: context.screenWidth * 0.35 - 55,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        //-- product price and quantity
                        Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: context.screenWidth * 0.2,
                              height: 25,
                              decoration: BoxDecoration(color: primary.shade500, borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.minimize, color: primary.shade300),
                                  Text(
                                    cartProducts[index].quantity.toString(),
                                    style: textExtraBoldContent14.copyWith(color: primary.shade300),
                                  ),
                                  Icon(Icons.add, color: primary.shade300),
                                ],
                              ),
                            ),
                            Text(
                              '₹${cartProducts[index].productPrice}',
                              style: textSemiContent10.copyWith(color: primary.shade500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 10),
              ),
              const SizedBox(height: 20),
              const SectionTitle(title: 'Complete your meal'),
              const SizedBox(height: 20),
              GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
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
              const SizedBox(height: 10),

              //-- notes and gift voucher section
            Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //-- notes or instruction and apply coupon section
                    Expanded(
                      child: SizedBox(
                        width: context.screenWidth * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 15,
                          children: [
                            //-- instruction section
                            ShadowContainer(
                              child: Row(
                                children: [
                                  SvgPicture.asset(AssetConstants.notePadWithPen),
                                  Text('Notes or instractions ', style: textSemiContent14.copyWith(color: primary.shade100)),
                                ],
                              ),
                            ),

                            //-- coupon section
                            ShadowContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('SAVINGS CORNER', style: textExtraBoldContent14.copyWith(color: primary.shade200)),

                                  //-- apply coupon and arrow icon
                                  Row(
                                    children: [
                                      SvgPicture.asset(AssetConstants.coupon),
                                      const SizedBox(width: 5),
                                      Text('Apply coupon', style: textSemiContent14.copyWith(color: primary.shade200)),
                                      const Spacer(),
                                      Icon(Icons.arrow_forward_ios, color: primary.shade500),
                                    ],
                                  ),
                                  const Divider(),

                                  Row(
                                    children: [
                                      SvgPicture.asset(AssetConstants.coupon),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        width: context.screenWidth * 0.25,
                                        child: Text(
                                          '₹16 saved on.......',
                                          style: textSemiContent14.copyWith(color: primary.shade200),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Spacer(),
                                      Icon(Icons.check, color: primary.shade500),
                                      const SizedBox(width: 5),
                                      Text('Applied', style: textSemiContent14.copyWith(color: primary.shade500)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    //-- gift section
                    ShadowContainer(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      height: context.screenHeight * 0.205,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          SvgPicture.asset(AssetConstants.gift, width: 55, height: 55, fit: BoxFit.cover),
                          const SizedBox(height: 10),
                          Text('Gift', style: textSemiContent14.copyWith(color: primary.shade200)),
                          Text('your order', style: textSemiContent14.copyWith(color: primary.shade200)),
                        ],
                      ),
                    ),
                  ],
                ),


              const SizedBox(height: 20),

              //-- give a tip section
              ShadowContainer(
                width: context.screenWidth,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Give a tip', style: textExtraBoldContent16.copyWith(color: primary.shade200)),
                          const SizedBox(height: 10),
                          Text('Appreciate your delivery hero!', style: textSemiContent12.copyWith(color: primary.shade200)),
                          Text('A small tip makes a big difference.', style: textSemiContent12.copyWith(color: primary.shade200)),
                          Text('Thank you!', style: textSemiContent12.copyWith(color: primary.shade200)),
                          const SizedBox(height: 10),
                          const SelectableChipsRow(),
                        ],
                      ),
                    ),
                    Expanded(child: SvgPicture.asset(AssetConstants.deliveryPath)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  contentTitle.length,
                  (i) => ElevatedBox(title: contentTitle[i], time: contentTime[i], description: contentDescription[i]),
                ),
              ),
              const SizedBox(height: 20),
              const SectionTitle(title: 'Delivery instructions '),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  deliveryInstructionsText.length,
                  (i) => ElevatedIconBox(imageUrl: deliveryInstructionsIcon[i], label: deliveryInstructionsText[i]),
                ),
              ),
              const SizedBox(height: 20),
              SlideToPayButton(
                price: ref.watch(amountToPay).toString(),
                sliderColor: primary.shade300,
                onSlideCompleted: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderConfirmationScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag({required String text, required double width}) {
    return Container(
      width: width,
      height: 20,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: primary.shade700),
      child: Center(
        child: Text(
          text,
          style: textExtraBoldContent10.copyWith(color: primary.shade500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
