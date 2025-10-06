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
  final bool? hasMultipleOptions;
  final String? category;
  final List<String>? features;

  //<editor-fold desc="Data Methods">
  const ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.rating,
    required this.imageUrl,
    required this.reviewCount,
    required this.quantity,
    required this.variants,
     this.hasMultipleOptions,
    this.category,
    this.features,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? brand,
    String? description,
    double? rating,
    String? imageUrl,
    int? reviewCount,
    int? quantity,
    List<ProductVariant>? variants,
    bool? hasMultipleOptions,
    String? category,
    List<String>? features,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      imageUrl: imageUrl ?? this.imageUrl,
      reviewCount: reviewCount ?? this.reviewCount,
      quantity: quantity ?? this.quantity,
      variants: variants ?? this.variants,
      hasMultipleOptions: hasMultipleOptions ?? this.hasMultipleOptions,
      category: category ?? this.category,
      features: features ?? this.features,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'brand': this.brand,
      'description': this.description,
      'rating': this.rating,
      'imageUrl': this.imageUrl,
      'reviewCount': this.reviewCount,
      'quantity': this.quantity,
      'variants': this.variants,
      'hasMultipleOptions': this.hasMultipleOptions,
      'category': this.category,
      'features': this.features,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      brand: map['brand'] ?? '',
      description: map['description'] ?? '',
      rating: map['rating'] ?? 0,
      imageUrl: map['imageUrl'] ?? '',
      reviewCount: map['reviewCount'] ?? 0,
      quantity: map['quantity'] ?? 0,
      variants: map['variants'] as List<ProductVariant>,
      hasMultipleOptions: map['hasMultipleOptions'] ?? false,
      category: map['category'] ?? '',
      features: map['features'] as List<String>,
    );
  }

  //</editor-fold>
}

class ProductVariant {
  final String id;
  final String size;
  final String unit;
  final double price;
  final double? originalPrice;
  final bool? inStock;
  final String imageUrl;
  final int? discountPercentage;
  final int quantity;

  bool get hasDiscount => originalPrice != null && originalPrice! > price;


  const ProductVariant({
    required this.id,
    required this.size,
    required this.unit,
    required this.price,
    this.originalPrice,
     this.inStock,
    required this.imageUrl,
    this.discountPercentage,
    required this.quantity,
  });


  ProductVariant copyWith({
    String? id,
    String? size,
    String? unit,
    double? price,
    double? originalPrice,
    bool? inStock,
    String? imageUrl,
    int? discountPercentage,
    int? quantity,
  }) {
    return ProductVariant(
      id: id ?? this.id,
      size: size ?? this.size,
      unit: unit ?? this.unit,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      inStock: inStock ?? this.inStock,
      imageUrl: imageUrl ?? this.imageUrl,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'size': this.size,
      'unit': this.unit,
      'price': this.price,
      'originalPrice': this.originalPrice,
      'inStock': this.inStock,
      'imageUrl': this.imageUrl,
      'discountPercentage': this.discountPercentage,
      'quantity': this.quantity,
    };
  }

  factory ProductVariant.fromMap(Map<String, dynamic> map) {
    return ProductVariant(
      id: map['id'] ?? '',
      size: map['size'] ?? '',
      unit: map['unit'] ?? '',
      price: map['price'] ?? 0,
      originalPrice: map['originalPrice'] ?? 0,
      inStock: map['inStock'] ?? false,
      imageUrl: map['imageUrl'] ?? '',
      discountPercentage: map['discountPercentage'] ?? 0,
      quantity: map['quantity'] ?? 0,
    );
  }

}
