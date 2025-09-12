
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/cart/view/widgets/cooking_idea_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../shared/widgets/rounded_button_3d_effect.dart';
import '../../shared/widgets/section_title.dart';
import '../../shared/widgets/shadow_container.dart';


class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                      child: SvgPicture.asset(AssetConstants.logo,height: 85,width: 110,fit: BoxFit.cover,)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.arrow_back_ios)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Congratulations',style: textSemiContent26.copyWith(color: primary.shade200),),
              const SizedBox(height: 10),
              Text('Restaurant will accept soon',style: textSemiContent20.copyWith(color: primary.shade50),),
              const SizedBox(height: 25),
              ShadowContainer(
                child: ListTile(
                  title: Text('Track your pilot',style: textExtraBoldContent16.copyWith(color: primary.shade200),),
                  trailing: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                      child: Image.asset(AssetConstants.trackMap,)),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: SectionTitle(title: 'Cooking ideas',),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (ctx, index) => const CookingIdeaCard(
                    title: 'Ashirvad 0% maida, 100% mp atta',
                    imageUrl: 'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0',
                  ),
                  separatorBuilder: (context, index) => const SizedBox(width: 8,),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: ShadowContainer(
                      child: ListTile(
                        title: Text(
                          'Scan QR code or OTP',
                          style: textExtraBoldContent16.copyWith(color: primary.shade100),
                        ),
                        trailing: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: SvgPicture.asset(AssetConstants.qr),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(4, 4),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-2, -2),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '30\nMin',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Text('Show your love',style: textExtraBoldContent14.copyWith(color: primary.shade200,fontSize: 15),),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                      (index) => const Icon(Icons.star, color: Colors.amber,size: 50),
                ),
              ),
              const SizedBox(height: 10),
              Rounded3DButton(
                text: "Repeat order",
                onPressed: () {
                  print("Button Pressed!");
                },
                width: context.screenWidth*0.45,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
