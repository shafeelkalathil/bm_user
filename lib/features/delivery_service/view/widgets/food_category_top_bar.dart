import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/asset_constants.dart';
import '../../../../core/utils/styles/text_style.dart';

class FoodCategoryTopBar extends StatelessWidget {
  const FoodCategoryTopBar({
    super.key,
    required this.title,
    required this.location,
    this.primaryColor = const Color(0xff4A4B4D),
    this.secondaryColor = const Color(0xffB6B7B7),
  });


  final String title,location;
  final Color primaryColor,secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(onTap: () {
              Navigator.pop(context);
            },child: Icon(Icons.arrow_back_ios,color: primaryColor,)),
            const SizedBox(width: 10,),
            Text(title,style: textExtraBold3XContent24.copyWith(color: primaryColor,fontSize: 25)),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(AssetConstants.search,color: secondaryColor,),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(location,style: textSemiContent14.copyWith(color: secondaryColor),),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset(AssetConstants.arrowDown,color: secondaryColor,),
            ),
          ],
        )
      ],
    );
  }
}