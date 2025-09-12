
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/product_card_with_add_button.dart';
import '../../shared/widgets/rounded_button_3d_effect.dart';
import '../../shared/widgets/section_title.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Column(
                spacing: 15,
                children: [
                  Image(image: AssetImage(AssetConstants.emptyCart),width: context.screenWidth*0.5,height: 160,fit: BoxFit.cover,),
                  Text('Uh! You don’t have any orders yet ',style: textBoldContent14.copyWith(fontSize: 15,color: primary.shade50),),
                  Rounded3DButton(
                    text: "Order now",
                    onPressed: () {
                      print("Button Pressed!");
                    },
                    width: context.screenWidth*0.55,
                  )

                ],
              )),
              const SizedBox(height: 40,),
              const SectionTitle(title: 'Complete your meal'),
              const SizedBox(height: 10,),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
