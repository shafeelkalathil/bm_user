class ProductModel {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double rating;
  final String imageUrl;
  final int reviewCount;
  final int quantity;
  final List<ProductVariant> variants;
  final bool hasMultipleOptions;
  final String? category;
  final List<String>? features;

  ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.rating,
    required this.quantity,
    required this.imageUrl,
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
  final String imageUrl;
  final int? discountPercentage;
  final int quantity;

  ProductVariant({
    required this.id,
    required this.size,
    required this.unit,
    required this.price,
    this.originalPrice,
    this.inStock = true,
    this.discountPercentage,
    required this.imageUrl,
    required this.quantity,
  });

  bool get hasDiscount => originalPrice != null && originalPrice! > price;
}
