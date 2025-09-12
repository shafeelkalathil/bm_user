
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_string_constants.dart';
import '../../../core/constants/asset_constants.dart';
import '../../shared/widgets/custom_app_bar.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStringConstants.offers,
        trailing: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(AssetConstants.search),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Body: List of Offer Cards
            Expanded(
              child: ListView.builder(
                itemCount: 3, // You can change this or load dynamically
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: OfferCard(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A single Offer Card widget with image background and rounded corners.
class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        AssetConstants.slider1,
        fit: BoxFit.cover,
        height: 190,
        width: double.infinity,
      ),
    );
  }
}
