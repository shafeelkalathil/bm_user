import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/asset_constants.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/styles/text_style.dart';
import '../../../shared/widgets/custom_elevated_button.dart';
import '../../model/offer_sample_model.dart';
import '../offers_screen.dart';
import 'benefit_item.dart';

class OfferBottomSheet extends StatelessWidget {
  final OfferSampleModel offer;

  const OfferBottomSheet({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: screenHeight * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHandle(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 28),
                  _buildDescription(),
                  const SizedBox(height: 10),
                  _buildBenefitsList(),
                  const SizedBox(height: 10),
                  _buildPromoCodeSection(context),
                  const SizedBox(height: 20),
                  _buildValidityInfo(),
                  const SizedBox(height: 20),
                  _buildDottedDivider(),
                  const SizedBox(height: 30),
                  _buildFooterLinks(),
                  const SizedBox(height: 20),
                  _buildRedeemButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHandle() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: 50,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: 'brand_logo_${offer.brand}',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SvgPicture.asset(
              AssetConstants.nikeBlack,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: context.screenWidth * 0.2),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${offer.discount} OFF',
                style: textBoldContent24.copyWith(
                  color: primary.shade800,
                ),
              ),
              Text(
                offer.brand,
                style: textBoldContent16.copyWith(
                  color: primary.shade800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      offer.description,
      style: textBold2XContent16.copyWith(color: primary.shade800),
    );
  }

  Widget _buildBenefitsList() {
    return Column(
      children: offer.benefits
          .map((benefit) => BenefitItem(text: benefit))
          .toList(),
    );
  }

  Widget _buildPromoCodeSection(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CustomElevatedButton(
        width: context.screenWidth * 0.6,
        onPressed: () => _copyToClipboard(context, offer.promoCode),
        isTransparent: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              offer.promoCode,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
            IconButton(
              onPressed: () => _copyToClipboard(context, offer.promoCode),
              icon: const Icon(Icons.copy, size: 25),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValidityInfo() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Valid until ${offer.expiryDate}',
        style: textBoldContent10.copyWith(color: primary.shade50),
      ),
    );
  }

  Widget _buildDottedDivider() {
    return Row(
      children: List.generate(
        65,
            (dotIndex) => Container(
          width: 2,
          height: 2,
          margin: const EdgeInsets.symmetric(horizontal: 1.5),
          decoration: const BoxDecoration(
            color: Color(0xff939598),
          ),
        ),
      ),
    );
  }

  Widget _buildFooterLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How to redeem',
          style: textBoldContent14.copyWith(color: primary.shade800),
        ),
        const SizedBox(height: 10),
        Text(
          'Terms and conditions',
          style: textBoldContent14.copyWith(color: primary.shade800),
        ),
      ],
    );
  }

  Widget _buildRedeemButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CustomElevatedButton(
        width: context.screenWidth * 0.45,
        height: 35,
        onPressed: () => _redeemOffer(context),
        isTransparent: true,
        borderColor: primary.shade200,
        child: Text(
          'Redeem now',
          style: textBoldContent18.copyWith(color: primary.shade200),
        ),
      ),
    );
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Coupon code $text copied to clipboard!'),
        backgroundColor: primary.shade200,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _redeemOffer(BuildContext context) {
    // Implement redeem functionality
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${offer.brand} offer redeemed successfully!'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}