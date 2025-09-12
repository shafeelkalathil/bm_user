class Product {
  final String id;
  final String name;
  final String brand;
  final String description;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final List<ProductVariant> variants;
  final bool hasMultipleOptions;
  final String? category;
  final List<String>? features;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.variants,
    this.hasMultipleOptions = false,
    this.category,
    this.features,
  });
}

class ProductVariant {
  final String id;
  final String size;
  final String unit;
  final double price;
  final double? originalPrice;
  final bool inStock;
  final int? discountPercentage;

  ProductVariant({
    required this.id,
    required this.size,
    required this.unit,
    required this.price,
    this.originalPrice,
    this.inStock = true,
    this.discountPercentage,
  });

  bool get hasDiscount => originalPrice != null && originalPrice! > price;
}