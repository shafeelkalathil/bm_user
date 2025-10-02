
class CartModel {
  final String productImage;
  final String productName;
  final double productPrice;
  final String productDescription;
  final String unit;
  final String size;
   int quantity;

  CartModel({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.unit,
    required this.size,
    required this.quantity,
  });

  CartModel copyWith({
    String? productImage,
    String? productName,
    double? productPrice,
    String? productDescription,
    String? unit,
    String? size,
    int? quantity,
  }) {
    return CartModel(
      productImage: productImage ?? this.productImage,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      productDescription: productDescription ?? this.productDescription,
      unit: unit ?? this.unit,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productImage': productImage,
      'productName': productName,
      'productPrice': productPrice,
      'productDescription': productDescription,
      'unit': unit,
      'size': size,
      'quantity': quantity,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      productImage: map['productImage'] ?? '',
      productName: map['productName'] ?? '',
      productPrice: map['productPrice']?.toDouble() ?? 0.0,
      productDescription: map['productDescription'] ?? '',
      unit: map['unit'] ?? '',
      size: map['size'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

}