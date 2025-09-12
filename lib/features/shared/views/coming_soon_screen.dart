import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: context.screenHeight,
            width: context.screenWidth,
            child: Image.asset(
              AssetConstants.comingSoon,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 15,
            right: 15,
            top: 50,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: primary.shade300,
                  ),
                ),
                Text(
                  title,
                  style: textExtraBold3XContent24.copyWith(
                      color: primary.shade300, fontSize: 25),
                ),
                const Spacer(),
                SvgPicture.asset(
                  AssetConstants.search,
                  color: primary.shade300,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
