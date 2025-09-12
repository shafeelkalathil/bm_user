import 'package:flutter/material.dart';
import '../../../core/constants/app_string_constants.dart';
import '../../../core/constants/asset_constants.dart';
import '../../delivery_service/view/deliver_service_screen.dart';
import '../views/coming_soon_screen.dart';
import 'category_icon_with_title.dart';

class BuildCategoryWidget extends StatelessWidget {
  const BuildCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryIcons = [
      AssetConstants.delivery,
      AssetConstants.transportation,
      AssetConstants.workers,
      AssetConstants.eService
    ];
    final categoryText = [
      AppStringConstants.delivery,
      AppStringConstants.transportation,
      AppStringConstants.workers,
      AppStringConstants.eService
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
          categoryIcons.length,
          (i) => CategoryIconWithTitle(
                icon: categoryIcons[i],
                label: categoryText[i],
                onTap: () {
                  if (i != 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ComingSoonScreen(title: categoryText[i]),
                        ));
                  } else if (i == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DeliveryServiceScreen(),
                        ));
                  }
                },
              )),
    );
  }
}
