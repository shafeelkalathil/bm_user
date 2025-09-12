import 'package:bm_user/features/profile/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/asset_constants.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/styles/text_style.dart';
import 'circular_icon.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.time, required this.location});

  final String time, location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(time,
                  style:
                      textExtraBoldContent20.copyWith(color: primary.shade200)),
              Text(location,
                  style: textSemiContent14.copyWith(color: primary.shade100)),
            ],
          ),
        ),
        SvgPicture.asset(AssetConstants.arrowDown),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
          },
            child: CircularIcon(svgPath: AssetConstants.manUser)),
      ],
    );
  }
}
