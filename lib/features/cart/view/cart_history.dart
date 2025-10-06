import 'package:bm_user/core/constants/color_constants.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/core/utils/styles/text_style.dart';
import 'package:bm_user/features/shared/widgets/custom_elevated_button.dart';
import 'package:bm_user/features/shared/widgets/shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:widgets_easier/widgets_easier.dart';
import '../../../core/constants/asset_constants.dart';
import '../../shared/widgets/custom_app_bar.dart';

class CartHistory extends StatefulWidget {
  CartHistory({super.key});

  @override
  State<CartHistory> createState() => _CartHistoryState();
}

class _CartHistoryState extends State<CartHistory> {
  TabController? tabController;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   tabController = TabController(length: tabs.length, vsync: this);
  // }

  //-- variables
  // final List<String> tabs = ['HISTORY', 'SCHEDULED', 'DRAFT', 'CANCELLED'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Cart',
          trailing: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(AssetConstants.search),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(13),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'HISTORY',
                        style: textBold2XContent14.copyWith(color: primary.shade50),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'SCHEDULED',
                        style: textBold2XContent14.copyWith(color: primary.shade50),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'DRAFT',
                          style: textBold2XContent14.copyWith(color: primary.shade50),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'CANCELLED',
                        style: textBold2XContent14.copyWith(color: primary.shade50),
                      ),
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
                          textstyle: textExtraBoldContent12,
                          color: primary.shade500,
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.01),

                      Expanded(
                        child: CartSectionElevatedButton(
                          text: 'E-SERVE',
                          textstyle: textExtraBoldContent12,
                          color: primary.shade100,
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.01),

                      Expanded(
                        child: CartSectionElevatedButton(
                          text: 'DELIVER',
                          textstyle: textExtraBoldContent12,
                          color: primary.shade100,
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.01),

                      Expanded(
                        child: CartSectionElevatedButton(
                          text: 'WORKER',
                          textstyle: textExtraBoldContent12,
                          color: primary.shade100,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: context.screenHeight * 0.7,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
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
                                    'KFC',
                                    style: textBoldContent18.copyWith(color: primary.shade200),
                                  ),
                                  Text(
                                    'Delivered',
                                    style: textBoldContent18.copyWith(color: primary.shade200),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  'Kottakkal',
                                  style: textBoldContent14.copyWith(color: primary.shade200),
                                ),
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
                                            '₹525',
                                            style: textSemiContent14.copyWith(
                                              color: primary.shade500,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Text(
                                              'MRP',
                                              style: textBoldContent14.copyWith(
                                                color: primary.shade100,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Text(
                                              '₹525;',
                                              style: textBoldContent14.copyWith(
                                                color: primary.shade100,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Details',
                                      style: textSemiContent14.copyWith(
                                        color: primary.shade600,
                                      ),
                                    ),
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
                                  'Peri Peri chicken wing -6 pcs',
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
                                    ShadowContainer(
                                      borderRadius: 28,
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                        'Re Order',
                                        style: textBoldContent18.copyWith(
                                          color: primary.shade200,
                                        ),
                                      ),
                                    ),
                                    ShadowContainer(
                                      borderRadius: 28,
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                        'Rate Food',
                                        style: textBoldContent18.copyWith(
                                          color: primary.shade200,
                                        ),
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
  const CartSectionElevatedButton({
    super.key,
    this.color,
    required this.textstyle,
    required this.text,
    this.borderRadius = 15,
  });

  final Color? color;
  final TextStyle textstyle;
  final String text;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(borderRadius!),
        ),
      ),
      onPressed: () {},
      child: Text(text, style: textstyle),
    );
  }
}
