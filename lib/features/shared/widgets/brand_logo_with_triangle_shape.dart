import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/asset_constants.dart';
import '../../popular_brands/views/popular_brand.dart';

class BrandLogoWithTriangleShape extends StatelessWidget {
  const BrandLogoWithTriangleShape({
    super.key, required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PopularBrandScreen(),));
      },
      child: Material(
        color: Colors.transparent,
        elevation: 6,
        shadowColor: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              AssetConstants.brandLogoBg,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 14,
              left: 10,
              child: Image.network(
                imageUrl,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}