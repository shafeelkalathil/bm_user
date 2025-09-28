import 'dart:ui';

class OfferSampleModel {
  final String brand;
  final String discount;
  final String expiryDate;
  final String promoCode;
  final Color brandColor;
  final String description;
  final List<String> benefits;

  OfferSampleModel({
    required this.brand,
    required this.discount,
    required this.expiryDate,
    required this.promoCode,
    required this.brandColor,
    required this.description,
    required this.benefits,
  });
}