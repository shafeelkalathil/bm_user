import 'package:bm_user/features/shared/widgets/shadow_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:widgets_easier/widgets_easier.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';

class ProductHistoryCard extends StatelessWidget {
  const ProductHistoryCard({super.key, required this.productName, required this.productPrice, required this.productActualPrice, required this.productDescription});
  final String productName;
  final String productPrice;
  final String productActualPrice;
  final String productDescription;

  @override
  Widget build(BuildContext context) {
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
                  productName,
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
                          productPrice,
                          style: textSemiContent14.copyWith(color: primary.shade500),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text('MRP', style: textBoldContent14.copyWith(color: primary.shade100)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            productActualPrice,
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
                productDescription,
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
  }
}
