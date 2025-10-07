import 'package:bm_user/core/constants/asset_constants.dart';
import 'package:bm_user/core/constants/color_constants.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/core/utils/styles/text_style.dart';
import 'package:bm_user/features/shared/widgets/custom_app_bar.dart';
import 'package:bm_user/features/shared/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReferPage extends StatelessWidget {
  const ReferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Refer A Friend'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(top: 20),
                child: Text("Refer Friends\nand Earn 2500/-", style: textExtraBold2XContent36.copyWith(color: primary.shade200)),
              ),
              SizedBox(
                width: context.screenWidth,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(top: 5),
                  child: Flexible(child: Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.", style: textSemiContent20.copyWith(color: primary.shade200))),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.only(top: 20),
                child: Container(
                  height: context.screenHeight * 0.4,
                  child: Stack(
                    children: [
                      Positioned(right: 80,bottom: 2,child: SvgPicture.asset(AssetConstants.referBackgroundImage)),
                      Positioned(right: 70,bottom: 2,child: SvgPicture.asset(AssetConstants.maleImage)),
                      Positioned(right: 70,bottom: 170,child: SvgPicture.asset(AssetConstants.femaleImage)),
                      Positioned(top: 40,right: 150,width: context.screenHeight* 0.08,child: SvgPicture.asset(AssetConstants.star),),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30),child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Get list of your friends',style: textSemiContent14,),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text('whom you can refer',
                  style: textBold2XContent16,
                  ),
                ),
              ],),),
              
              Padding(padding: EdgeInsetsGeometry.only(top: 40),child: CustomElevatedButton(onPressed: () {
                
              }, isTransparent: false, child: Text('Find Friends',
              style: textBold2XContent18.copyWith(color: primary.shade300),
              )),)
            ],
          ),
        ),
      ),
    );
  }
}
