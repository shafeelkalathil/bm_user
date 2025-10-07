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
import '../../shared/widgets/custom_rectangle_button.dart';
import '../../shared/widgets/historyCard.dart';

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
        body:ref.watch(cartHistory).isEmpty ? Center(child: Text("No Cart History Found")): Padding(
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
                        child: CustomRectangleButton(
                          text: 'TRANSP',
                          textstyle: textExtraBoldContent12,
                          color: primary.shade500,
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.01),

                      Expanded(
                        child: CustomRectangleButton(
                          text: 'E-SERVE',
                          textstyle: textExtraBoldContent12,
                          color: primary.shade100,
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.01),

                      Expanded(
                        child: CustomRectangleButton(
                          text: 'DELIVER',
                          textstyle: textExtraBoldContent12,
                          color: primary.shade100,
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.01),

                      Expanded(
                        child: CustomRectangleButton(
                          text: 'WORKER',
                          textstyle: textExtraBoldContent12,
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
                          return ProductHistoryCard(productDescription: cartHistoryProduct.productDescription,productActualPrice: cartHistoryProduct.productPrice.toString(),productPrice: cartHistoryProduct.productPrice.toString(),productName: cartHistoryProduct.productName,);
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




