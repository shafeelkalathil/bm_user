import 'package:bm_user/core/common_variables.dart';
import 'package:bm_user/core/constants/color_constants.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/core/utils/styles/text_style.dart';
import 'package:bm_user/features/shared/widgets/shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:widgets_easier/widgets_easier.dart';
import '../../../core/constants/asset_constants.dart';
import '../../shared/widgets/custom_app_bar.dart';

class CartHistory extends ConsumerStatefulWidget {
  CartHistory({super.key});

  @override
  ConsumerState<CartHistory> createState() => _CartHistoryState();
}

class _CartHistoryState extends ConsumerState<CartHistory> {
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Cart',
          trailing: Padding(padding: const EdgeInsets.all(10), child: SvgPicture.asset(AssetConstants.search)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(13),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text('HISTORY', style: textBold2XContent14.copyWith(color: primary.shade50)),
                    ),
                    Expanded(
                      child: Text('SCHEDULED', style: textBold2XContent14.copyWith(color: primary.shade50), softWrap: false),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('DRAFT', style: textBold2XContent14.copyWith(color: primary.shade50), softWrap: false),
                      ),
                    ),
                    Expanded(
                      child: Text('CANCELLED', style: textBold2XContent14.copyWith(color: primary.shade50), softWrap: false),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: CartSectionElevatedButton(
                          text: 'TRANSP',
                          textstyle: textExtraBoldContent12.copyWith(fontSize: 7),
                          color: primary.shade500,
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.01),

                      Expanded(
                        child: FittedBox(
                          child: CartSectionElevatedButton(
                            text: 'E-SERVE',
                            textstyle: textExtraBoldContent12.copyWith(fontSize: 7),
                            color: primary.shade100,
                          ),
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.01),

                      Expanded(
                        child: CartSectionElevatedButton(
                          text: 'DELIVER',
                          textstyle: textExtraBoldContent12.copyWith(fontSize: 7),
                          color: primary.shade100,
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.01),

                      Expanded(
                        child: CartSectionElevatedButton(
                          text: 'WORKER',
                          textstyle: textExtraBoldContent12.copyWith(fontSize: 7),
                          color: primary.shade100,
                        ),
                      ),
                    ],
                  ),
                ),

                Consumer(
                  builder: (context, ref, child) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      height: context.screenHeight * 0.7,
                      child: ListView.builder(
                        itemCount: ref.watch(cartHistory).length,
                        itemBuilder: (context, index) {
                          var cartHistoryProduct = ref.watch(cartHistory)[index];
                          return ShadowContainer(
                            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        cartHistoryProduct.productName,
                                        style: textBoldContent18.copyWith(color: primary.shade200),
                                      ),
                                      Text('Delivered', style: textBoldContent18.copyWith(color: primary.shade200)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text('Kottakkal', style: textBoldContent14.copyWith(color: primary.shade200)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 13),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Text(
                                                cartHistoryProduct.productPrice.toString(),
                                                style: textSemiContent14.copyWith(color: primary.shade500),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 5),
                                                child: Text('MRP', style: textBoldContent14.copyWith(color: primary.shade100)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 5),
                                                child: Text(
                                                  cartHistoryProduct.productPrice.toString(),
                                                  style: textBoldContent14.copyWith(color: primary.shade100),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text('Details', style: textSemiContent14.copyWith(color: primary.shade600)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 23),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: DecoratedBox(
                                        decoration: ShapeDecoration(
                                          shape: DottedBorder(
                                            dotShape: BorderDotShape.square,
                                            color: primary.shade100,
                                            dotSize: 2,
                                            dotSpacing: 5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      cartHistoryProduct.productDescription,
                                      style: textSemiContent14.copyWith(color: primary.shade200),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'September 12 , 10:00 pm',
                                      style: textSemiContent14.copyWith(color: primary.shade100),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: ShadowContainer(
                                            borderRadius: 28,
                                            padding: EdgeInsets.all(20),
                                            child: Center(child: Text('Re Order', style: textBoldContent14.copyWith(color: primary.shade200),softWrap: false,)),
                                          ),
                                        ),
                                        Expanded(
                                          child: ShadowContainer(
                                            borderRadius: 28,
                                            padding: EdgeInsets.all(20),
                                            child: Center(child: Text('Rate Food', style: textBoldContent14.copyWith(color: primary.shade200),softWrap: false,)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartSectionElevatedButton extends StatelessWidget {
  const CartSectionElevatedButton({super.key, this.color, required this.textstyle, required this.text, this.borderRadius = 15});

  final Color? color;
  final TextStyle textstyle;
  final String text;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(borderRadius!)),
      ),
      onPressed: () {},
      child: Text(text, style: textstyle, softWrap: false),
    );
  }
}
