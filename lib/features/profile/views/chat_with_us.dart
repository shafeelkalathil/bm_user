import 'package:bm_user/core/constants/asset_constants.dart';
import 'package:bm_user/core/constants/color_constants.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/core/utils/styles/text_style.dart';
import 'package:bm_user/features/shared/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatWithUs extends StatelessWidget {
  const ChatWithUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(top: 40),
            child: Center(child: SvgPicture.asset(AssetConstants.chatWithUSImage)),
          ),

          //-- register a complaint button
          CustomElevatedButton(
            margin:  EdgeInsetsGeometry.only(top: 35),
            width: context.screenWidth * 0.85,
            onPressed: () {},
            borderColor: Colors.transparent,
            backGroundColor: Colors.grey.shade200,
            isTransparent: true,
            child: Text('Register A Complaint', style: textSemiContent20.copyWith(color: primary.shade50)),
          ),

          //-- connect with us button
          CustomElevatedButton(
            margin:  EdgeInsetsGeometry.only(top: 10),
            width: context.screenWidth * 0.85,
            onPressed: () {},
            borderColor: Colors.transparent,
            backGroundColor: Colors.grey.shade200,
            isTransparent: true,
            child: Text('Connect With Us', style: textSemiContent20.copyWith(color: primary.shade50)),
          ),
        ],
      ),
    );
  }
}
