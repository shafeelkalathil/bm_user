
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/styles/text_style.dart';
import '../../../shared/widgets/custom_dahsed_divider.dart';
import '../restaurant_detail_screen.dart';

class RestaurantCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String offer;
  final String time;
  final String distance;
  final String rating;

  const RestaurantCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.offer,
    required this.time,
    required this.distance,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RestaurantDetailScreen(
            imageUrl: imageUrl,
            restaurantTitle: title,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: imageUrl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  imageUrl,
                  height: 120,
                  width: context.screenWidth * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: textBold2XContent18.copyWith(color: primary.shade200),
                          ),
                        ),
                        SvgPicture.asset(AssetConstants.heartFill)
                      ],
                    ),
                    const SizedBox(height: 15),
                    const DashedDivider(
                      height: 1,
                      dashWidth: 6,
                      dashSpacing: 4,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      spacing: 5,
                      children: [
                        SvgPicture.asset(AssetConstants.coupon),
                        Expanded(
                          child: Text(
                            offer,
                            style: textSemiContent8.copyWith(
                              color: primary.shade200,
                              fontSize: 9,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset(AssetConstants.timer),
                        const SizedBox(width: 5),
                        Text(
                          '$time · $distance',
                          style: textExtraBoldContent6.copyWith(color: primary.shade50),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: primary.shade500,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            spacing: 2,
                            children: [
                              Text(
                                rating,
                                style: textBoldContent10.copyWith(
                                  fontSize: 11,
                                  color: primary.shade300,
                                ),
                              ),
                              SvgPicture.asset(AssetConstants.starWhite),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}