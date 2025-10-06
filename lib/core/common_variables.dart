import 'package:bm_user/features/shared/models/cart_model.dart';
import 'package:bm_user/features/shared/models/product_model.dart';
import 'package:flutter_riverpod/legacy.dart';

final cartProducts = StateProvider<List<CartModel>>((ref) => []);
final cartHistory =StateProvider<List<CartModel>> ((ref) => [],) ;

List<ProductModel> demoProducts = [
  ProductModel(
    quantity: 3,
    name: 'Lays Chips',
    imageUrl:
        'https://images.unsplash.com/photo-1741520149938-4f08654780ef?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    category: 'Snacks',
    hasMultipleOptions: true,
    id: '',
    brand: 'Lays',
    description: 'coool chips and tasty good for health',
    rating: 4.5,
    reviewCount: 10,
    variants: [
      ProductVariant(

        quantity: 3,
        imageUrl:
            'https://images.unsplash.com/photo-1741520149938-4f08654780ef?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        id: '1',
        size: '200',
        unit: 'g',
        price: 40,
        originalPrice: 50,
        inStock: true,
        discountPercentage: 20,
      ),
      // ProductVariant(
      //   imageUrl:
      //       'https://images.unsplash.com/photo-1741520149938-4f08654780ef?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      //
      //   quantity: 5,
      //   id: '2',
      //   size: '500',
      //   unit: 'g',
      //   price: 90,
      //   originalPrice: 120,
      //   inStock: true,
      //   discountPercentage: 25,
      // ),
    ],
  ),
  ProductModel(
    quantity: 12,
    name: 'Pepsi Bottle',
    imageUrl:
        'https://images.unsplash.com/photo-1629203849820-fdd70d49c38e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

    category: 'Drinks',
    variants: [
      ProductVariant(
        quantity: 4,
        imageUrl:
            'https://images.unsplash.com/photo-1629203849820-fdd70d49c38e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

        id: '1',
        size: '400',
        unit: 'ml',
        price: 30,
        originalPrice: 35,
        discountPercentage: 10,
        inStock: true,
      ),
      ProductVariant(
        quantity: 8,
        imageUrl:
            'https://images.unsplash.com/photo-1629203849820-fdd70d49c38e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

        id: '2',
        size: '800',
        unit: 'ml',
        price: 60,
        originalPrice: 70,
        discountPercentage: 10,
        inStock: true,
      ),
    ],
    id: '',
    brand: '',
    description: 'make cool in hot weather',
    rating: 4.3,
    reviewCount: 20,
  ),
  ProductModel(
    quantity: 7,
    name: 'Burger Combo',
    imageUrl:
        'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0',

    variants: [
      ProductVariant(
        quantity: 7,
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0',

        id: '1',
        price: 60,
        unit: 'pcs',
        inStock: true,
        discountPercentage: 10,
        originalPrice: 80,
        size: '1',
      ),
      // ProductVariant(
      //   quantity: 3,
      //   imageUrl:
      //       'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0',
      //
      //   id: '2',
      //   price: 100,
      //   unit: 'pcs',
      //   inStock: true,
      //   discountPercentage: 10,
      //   originalPrice: 120,
      //   size: "2",
      // ),
    ],
    category: 'Food',
    brand: 'McDonalds',
    description: 'Delicious burger combo with fris and drinks',
    id: '',
    rating: 4.0,
    reviewCount: 35,
    hasMultipleOptions: true,
  ),
  ProductModel(
    quantity: 5,
    name: 'Tasty Snacks',
    imageUrl:
        'https://images.unsplash.com/photo-1569419915350-4618d98b08f8?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    category: 'Snacks',
    variants: [
      ProductVariant(
        quantity: 2,
        id: '1',
        size: "25",
        unit: 'pcs',
        price: 50,
        imageUrl:
            'https://images.unsplash.com/photo-1569419915350-4618d98b08f8?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      ProductVariant(
        quantity: 3,
        id: '2',
        size: "25",
        unit: 'pcs',
        price: 70,
        imageUrl:
            'https://images.unsplash.com/photo-1569419915350-4618d98b08f8?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
    ],
    id: '',
    brand: 'Snacky',
    description: "Assorted tasty snacks",
    rating: 4.2,
    reviewCount: 15,
    hasMultipleOptions: true,
  ),
];
