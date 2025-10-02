import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/shared/models/product_model.dart';
import 'package:bm_user/features/shared/widgets/product_card_with_add_button.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import 'brand_logo_with_triangle_shape.dart';
import 'custom_elevated_button.dart';
//
// class RecommendedProductSection extends StatelessWidget {
//   const RecommendedProductSection({super.key,required this.products, required this.isSmaller, this.isFullScreen = false});
//
//   final List<Map<String, String>> products;
//   final bool isSmaller,isFullScreen;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: context.screenWidth,
//       height: isFullScreen ? context.screenHeight * 0.9: context.screenHeight * 0.58,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color(0xFFA064BA), // Top color
//             Color(0xFF672B83), // Bottom color
//           ],
//         ),
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
//       child: Column(
//         children: [
//           const SizedBox(height: 16),
//           if(!isSmaller)Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             spacing: 12,
//             children: [
//               BrandLogoWithTriangleShape(imageUrl: 'https://eastern.in/wp-content/uploads/2016/09/cropped-logo-easternapp.png'),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Eastern Powder',
//                     style: textExtraBoldContent16.copyWith(
//                       color: primary.shade300,
//                     ),
//                   ),
//                   Text('Recommended for\ntasty foods',style: textBoldContent14.copyWith(color: primary.shade300),)
//                 ],
//               ),
//               Image.asset(AssetConstants.vegetables)
//             ],
//           ),
//           if(isSmaller)Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   BrandLogoWithTriangleShape(imageUrl: 'https://eastern.in/wp-content/uploads/2016/09/cropped-logo-easternapp.png'),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Eastern Powder',
//                         style: textExtraBoldContent16.copyWith(
//                           color: primary.shade300,
//                         ),
//                       ),
//                       Text('Recommended for\ntasty foods',style: textBoldContent14.copyWith(color: primary.shade300),)
//                     ],
//                   ),
//                 ],
//               ),
//               Image.asset(AssetConstants.vegetables)
//             ],
//           ),
//           const SizedBox(height: 16),
//           isFullScreen ? SizedBox(
//             height: context.screenHeight * 0.65,
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,childAspectRatio: 0.5,crossAxisSpacing: 5,mainAxisSpacing: 5),
//               itemCount: products.length,
//               itemBuilder: (_, index) => ProductCardWithAddButton(
//                 isBg: true,
//                 imageUrl: products[index]['imageUrl']!,
//                 title: products[index].productName,
//                 price: '525',
//                 time: '8 min',
//                 subTitle: 'Ashirvad 0% maida, 100% mp atta',
//                 offerPer: '12',
//                 itemQty: '1 kg',
//                 onTap: () {},
//               ),
//             ),
//           ):SizedBox(
//             height: context.screenHeight * 0.28,
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               itemCount: products.length,
//               separatorBuilder: (_, __) => const SizedBox(width: 12),
//               itemBuilder: (_, index) => ProductCardWithAddButton(
//                 isBg: true,
//                 imageUrl: products[index]['imageUrl']!,
//                 title: products[index].productName,
//                 price: '525',
//                 time: '8 min',
//                 subTitle: 'Ashirvad 0% maida, 100% mp atta',
//                 offerPer: '12',
//                 itemQty: '1 kg',
//                 onTap: () {},
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           if(!isFullScreen)CustomElevatedButton(
//             width: double.infinity,
//             height: 55,
//             onPressed: () {},
//             isTransparent: true,
//             borderColor: Colors.transparent,
//             borderRadius: 15,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'See all products',
//                   style: textExtraBoldContent14.copyWith(
//                     color: primary.shade200,
//                   ),
//                 ),
//                 Icon(Icons.arrow_forward_ios,color: primary.shade200,)
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

class RecommendedProductSection extends StatelessWidget {
  const RecommendedProductSection({
    super.key,
    required this.products,
    required this.isSmaller,
    this.isFullScreen = false,
  });

  final List<ProductModel> products;
  final bool isSmaller, isFullScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFA064BA), Color(0xFF672B83)],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          const SizedBox(height: 16),

          /// Header
          if (!isSmaller)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BrandLogoWithTriangleShape(
                  imageUrl:
                      'https://eastern.in/wp-content/uploads/2016/09/cropped-logo-easternapp.png',
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Eastern Powder',
                      style: textExtraBoldContent16.copyWith(color: primary.shade300),
                    ),
                    Text(
                      'Recommended for\ntasty foods',
                      style: textBoldContent14.copyWith(color: primary.shade300),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(AssetConstants.vegetables),
              ],
            ),

          if (isSmaller)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BrandLogoWithTriangleShape(
                      imageUrl:
                          'https://eastern.in/wp-content/uploads/2016/09/cropped-logo-easternapp.png',
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Eastern Powder',
                      style: textExtraBoldContent16.copyWith(color: primary.shade300),
                    ),
                    Text(
                      'Recommended for\ntasty foods',
                      style: textBoldContent14.copyWith(color: primary.shade300),
                    ),
                  ],
                ),
                Image.asset(AssetConstants.vegetables),
              ],
            ),

          const SizedBox(height: 16),

          /// Product list
          if (isFullScreen)
            // Use Expanded + GridView
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (_, index) => ProductCardWithAddButton(
                  isBg: true,
                  singleProduct: products[index],
                  // imageUrl: products[index].imageUrl,
                  // title: products[index].name,
                  // price: products[index].variants[index].price.round.toString(),
                  // time: '8 min',
                  // subTitle: 'Ashirvad 0% maida, 100% mp atta',
                  // offerPer: products[index].variants[index].discountPercentage.toString(),
                  // itemQty: products[index].variants[index].unit.toString(),
                  onTap: () {},
                  productWithOption: true,
                ),
              ),
            )
          else
            SizedBox(
              height: context.screenHeight * 0.28,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, index) => ProductCardWithAddButton(
                  singleProduct: products[index],
                  // imageUrl: products[index].imageUrl,
                  // title: products[index].name,
                  // price: products[index].variants[index].price.round.toString(),
                  // time: '8 min',
                  // subTitle: 'Ashirvad 0% maida, 100% mp atta',
                  // offerPer: products[index].variants[index].discountPercentage.toString(),
                  // itemQty: products[index].variants[index].unit.toString(),
                  onTap: () {},
                  productWithOption: true,
                ),
              ),
            ),

          const SizedBox(height: 16),

          if (!isFullScreen)
            CustomElevatedButton(
              width: double.infinity,
              height: 55,
              onPressed: () {},
              isTransparent: true,
              borderColor: Colors.transparent,
              borderRadius: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'See all products',
                    style: textExtraBoldContent14.copyWith(color: primary.shade200),
                  ),
                  Icon(Icons.arrow_forward_ios, color: primary.shade200, size: 16),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
