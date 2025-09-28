import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/styles/text_style.dart';
import '../../model/offer_sample_model.dart';
import 'offer_bottom_sheet.dart';

class OfferCard extends StatelessWidget {
  final OfferSampleModel offer;
  final int index;

  const OfferCard({
    super.key,
    required this.offer,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showOfferBottomSheet(context),
      child: Hero(
        tag: 'offer_card_$index',
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              _buildBrandLogo(),
              const SizedBox(width: 10),
              _buildDottedDivider(),
              const SizedBox(width: 25),
              _buildOfferDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandLogo() {
    return Container(
      width: 85,
      height: 110,
      decoration: BoxDecoration(
        color: offer.brandColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          offer.brand,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDottedDivider() {
    return SizedBox(
      width: 1,
      child: Column(
        children: List.generate(
          15,
              (dotIndex) => Container(
            width: 20,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 1.5),
            decoration: const BoxDecoration(
              color: Color(0xff939598),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOfferDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${offer.discount} off',
            style: textBold2XContent24.copyWith(
              color: primary.shade200,
            ),
          ),
          Text(
            offer.brand,
            style: textBoldContent20.copyWith(
              color: primary.shade200,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Expires soon',
            style: textBoldContent12.copyWith(
              color: primary.shade900,
            ),
          ),
          Text(
            'Valid until ${offer.expiryDate}',
            style: textBoldContent12.copyWith(
              color: primary.shade100,
            ),
          ),
        ],
      ),
    );
  }

  void _showOfferBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      builder: (context) => OfferBottomSheet(offer: offer),
    );
  }
}