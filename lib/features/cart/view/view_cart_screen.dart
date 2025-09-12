
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/cart/view/widgets/elevated_box.dart';
import 'package:bm_user/features/cart/view/widgets/elevated_icon_box.dart';
import 'package:bm_user/features/cart/view/widgets/selectable_chip_row.dart';
import 'package:bm_user/features/cart/view/widgets/slidetopay_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_string_constants.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../shared/widgets/custom_elevated_button.dart';
import '../../shared/widgets/product_card_with_add_button.dart';
import '../../shared/widgets/section_title.dart';
import '../../shared/widgets/shadow_container.dart';
import 'order_confirmation_screen.dart';

class ViewCartScreen extends StatelessWidget {
  const ViewCartScreen({super.key});

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

    final List<String> deliveryInstructionsText = [
      AppStringConstants.avoidRingingBell,
      AppStringConstants.leaveAtTheDoor,
      AppStringConstants.directionToReach,
      AppStringConstants.leaveWithSecurity,
      AppStringConstants.avoidCalling
    ];
    final List<String> deliveryInstructionsIcon = [
      AssetConstants.bell,
      AssetConstants.leaveAtDoor,
      AssetConstants.locationGrey,
      AssetConstants.security,
      AssetConstants.phone
    ];

    final List<String> contentTitle = [
      'Lightning ',
      'Eco saver',
      'SHEDULE YOUR ORDER'
    ];
    final List<String> contentTime = ['20-25 mins', '30-35 mins', ''];
    final List<String> contentDescription = [
      'Appreciate your delivery',
      'Appreciate your delivery',
      'Select your date & time'
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    child: Text(
                      'Add',
                      style:
                          textSemiContent14.copyWith(color: primary.shade200),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ShadowContainer(
                        child: Row(
                      spacing: 10,
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.shopping_basket,
                              color: Colors.orange),
                        ),
                        SizedBox(
                          width: context.screenWidth * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 10,
                            children: [
                              Text(
                                'Ashirvad 0% maida, 100% mp atta',
                                style: textSemiContent14.copyWith(
                                    color: primary.shade200),
                              ),
                              SizedBox(
                                width: context.screenWidth * 0.35,
                                child: Row(
                                  spacing: 6,
                                  children: [
                                    _buildTag('1 kg', 45),
                                    Expanded(
                                        child: _buildTag('Wheat atta',
                                            context.screenWidth * 0.35 - 55)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: context.screenWidth * 0.2,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: primary.shade500,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.minimize, color: primary.shade300),
                                  Text(
                                    '2',
                                    style: textExtraBoldContent14.copyWith(
                                        color: primary.shade300),
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: primary.shade300,
                                  )
                                ],
                              ),
                            ),
                            Text(
                              '₹535 MRP',
                              style: textSemiContent10.copyWith(
                                color: primary.shade500,
                              ),
                            ),
                          ],
                        )
                      ],
                    ));
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: 3),
              const SizedBox(
                height: 20,
              ),
              const SectionTitle(title: 'Complete your meal'),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                physics: const ScrollPhysics(),
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
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.screenWidth * 0.6,
                    height: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 15,
                      children: [
                        ShadowContainer(
                          child: Row(
                            children: [
                              SvgPicture.asset(AssetConstants.notePadWithPen),
                              Text(
                                'Notes or instractions ',
                                style: textSemiContent14.copyWith(
                                    color: primary.shade100),
                              )
                            ],
                          ),
                        ),
                        ShadowContainer(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SAVINGS CORNER',
                              style: textExtraBoldContent14.copyWith(
                                  color: primary.shade200),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(AssetConstants.coupon),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Apply coupon',
                                  style: textSemiContent14.copyWith(
                                      color: primary.shade200),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: primary.shade500,
                                )
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                SvgPicture.asset(AssetConstants.coupon),
                                const SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                    width: context.screenWidth * 0.25,
                                    child: Text(
                                      '₹16 saved on.......',
                                      style: textSemiContent14.copyWith(
                                          color: primary.shade200),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                const Spacer(),
                                Icon(
                                  Icons.check,
                                  color: primary.shade500,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Applied',
                                  style: textSemiContent14.copyWith(
                                      color: primary.shade500),
                                )
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    width: context.screenWidth * 0.3,
                    height: 160,
                    child: ShadowContainer(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SvgPicture.asset(
                            AssetConstants.gift,
                            width: 55,
                            height: 55,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Gift',
                            style: textSemiContent14.copyWith(
                                color: primary.shade200),
                          ),
                          Text(
                            'your order',
                            style: textSemiContent14.copyWith(
                                color: primary.shade200),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ShadowContainer(
                  width: context.screenWidth,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Give a tip',
                              style: textExtraBoldContent16.copyWith(
                                  color: primary.shade200),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Appreciate your delivery hero!',
                              style: textSemiContent12.copyWith(
                                  color: primary.shade200),
                            ),
                            Text(
                              'A small tip makes a big difference.',
                              style: textSemiContent12.copyWith(
                                  color: primary.shade200),
                            ),
                            Text(
                              'Thank you!',
                              style: textSemiContent12.copyWith(
                                  color: primary.shade200),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SelectableChipsRow()
                          ],
                        ),
                      ),
                      SvgPicture.asset(AssetConstants.deliveryPath)
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    contentTitle.length,
                    (i) => ElevatedBox(
                          title: contentTitle[i],
                          time: contentTime[i],
                          description: contentDescription[i],
                        )),
              ),
              const SizedBox(
                height: 20,
              ),
              const SectionTitle(title: 'Delivery instructions '),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    deliveryInstructionsText.length,
                    (i) => ElevatedIconBox(
                          imageUrl: deliveryInstructionsIcon[i],
                          label: deliveryInstructionsText[i],
                        )),
              ),
              const SizedBox(
                height: 20,
              ),
              SlideToPayButton(
                price: ' ₹525',
                sliderColor: primary.shade300,
                onSlideCompleted: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const OrderConfirmationScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text, double width) {
    return Container(
      width: width,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: primary.shade700,
      ),
      child: Center(
        child: Text(
          text,
          style: textExtraBoldContent10.copyWith(
            color: primary.shade500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
