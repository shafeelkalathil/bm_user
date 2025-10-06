import 'package:bm_user/core/common_variables.dart';
import 'package:bm_user/core/constants/app_string_constants.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/cart/controller/cart_controller.dart';
import 'package:bm_user/features/shared/models/cart_model.dart';
import 'package:bm_user/features/shared/views/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../models/product_model.dart';
import 'custom_elevated_button.dart';

class ProductCardWithAddButton extends ConsumerStatefulWidget {
  const ProductCardWithAddButton({
    super.key,
    // required this.imageUrl,
    // required this.title,
    // required this.subTitle,
    // required this.offerPer,
    // required this.price,
    // required this.time,
    // required this.itemQty,
    this.onTap,
    this.onAddPressed,
    this.isBg = false,
    required this.productWithOption,
    required this.singleProduct,
    this.productId, // Add this parameter for unique hero tags
  });

  final ProductModel singleProduct;

  // final String imageUrl;
  // final String title;
  // final String subTitle;
  // final String offerPer;
  // final String price;
  // final String time;
  // final String itemQty;
  final VoidCallback? onTap;
  final VoidCallback? onAddPressed;
  final bool isBg;
  final bool productWithOption;
  final String? productId;

  @override
  ConsumerState<ProductCardWithAddButton> createState() => _ProductCardWithAddButtonState();
}

class _ProductCardWithAddButtonState extends ConsumerState<ProductCardWithAddButton> {
  // For unique hero tags
  final grossItemQuantity = StateProvider((ref) => 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var a in widget.singleProduct.variants) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (widget.singleProduct.variants.length > 1) {
          ref.watch(grossItemQuantity.notifier).state += a.quantity;
        } else {
          ref.watch(grossItemQuantity.notifier).state += widget.singleProduct.quantity;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Generate unique hero tag
    final String heroTag =
        widget.productId ?? 'product_${widget.singleProduct.name.hashCode}_${widget.singleProduct.name.hashCode}';

    ProductModel product = ProductModel(
      quantity: widget.singleProduct.quantity,
      id: heroTag,
      // Use the same ID for consistency
      name: widget.singleProduct.name,
      // Use actual title from parameters
      brand: 'Ashirvad',
      description:
          'Ashirvad 100% Atta with Multigrain goodness. The goodness of six grains in one pack, wheat, soya, chana, makka, bajra, jau & psyllium husk, making your roti more nutritious.',
      imageUrl: widget.singleProduct.imageUrl,
      // Use actual imageUrl from parameters
      rating: 4.5,
      reviewCount: 128,
      hasMultipleOptions: widget.productWithOption,
      // Use the actual parameter
      category: 'Flour & Grains',
      features: [
        'Made from 100% whole wheat',
        'Contains 6 nutritious grains',
        'Rich in fiber and protein',
        'No artificial preservatives',
        'Perfect for making soft rotis',
      ],
      variants: widget.productWithOption
          ? [
              ProductVariant(
                quantity: widget.singleProduct.quantity,
                imageUrl: widget.singleProduct.variants.first.imageUrl,
                id: '${heroTag}-500g',
                size: '500',
                unit: 'g',
                price: double.tryParse(widget.singleProduct.variants.first.price.toString()) ?? 332,
                originalPrice: (double.tryParse(widget.singleProduct.variants.first.originalPrice.toString()) ?? 332) * 1.1,
                discountPercentage: int.tryParse(widget.singleProduct.variants.first.discountPercentage.toString()) ?? 5,
              ),
              ProductVariant(
                quantity: widget.singleProduct.quantity,
                imageUrl: widget.singleProduct.variants.first.imageUrl,
                id: '${heroTag}-1kg',
                size: '1',
                unit: 'kg',
                price: (double.tryParse(widget.singleProduct.variants.first.price.toString()) ?? 332) * 1.8,
                originalPrice: (double.tryParse(widget.singleProduct.variants.first.originalPrice.toString()) ?? 332) * 2.0,
                discountPercentage: int.tryParse(widget.singleProduct.variants.first.discountPercentage.toString()) ?? 8,
              ),
              ProductVariant(
                quantity: widget.singleProduct.quantity,
                imageUrl: widget.singleProduct.variants.first.imageUrl,
                id: '${heroTag}-5kg',
                size: '5',
                unit: 'kg',
                price: (double.tryParse(widget.singleProduct.variants.first.price.toString()) ?? 332) * 5.4,
                originalPrice: (double.tryParse(widget.singleProduct.variants.first.originalPrice.toString()) ?? 332) * 6.0,
                discountPercentage: int.tryParse(widget.singleProduct.variants.first.discountPercentage.toString()) ?? 10,
              ),
            ]
          : [
              ProductVariant(
                quantity: widget.singleProduct.quantity,
                imageUrl: widget.singleProduct.variants.first.imageUrl,
                id: '${heroTag}-single',
                size: widget.singleProduct.quantity.toString().replaceAll(RegExp(r'[^0-9]'), ''),
                unit: widget.singleProduct.quantity.toString().replaceAll(RegExp(r'[0-9]'), '').trim(),
                price: double.tryParse(widget.singleProduct.variants.first.price.toString()) ?? 332,
                originalPrice: (double.tryParse(widget.singleProduct.variants.first.originalPrice.toString()) ?? 332) * 1.1,
                discountPercentage: int.tryParse(widget.singleProduct.variants.first.discountPercentage.toString()) ?? 5,
              ),
            ],
    );

    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image and ADD button with Hero widget
          Container(
            width: context.screenWidth * 0.35,
            height: context.screenWidth * 0.35,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
            child: Stack(
              children: [
                // Hero widget wrapping the image
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => ProductDetailsScreen(product: product),
                        transitionDuration: const Duration(milliseconds: 300),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                      ),
                    );
                  },
                  child: Hero(
                    tag: 'product_$heroTag', // Unique hero tag
                    child: Material(
                      color: Colors.transparent,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.network(
                          widget.singleProduct.imageUrl,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) => progress == null
                              ? child
                              : Container(
                                  decoration: BoxDecoration(color: primary.shade100, borderRadius: BorderRadius.circular(14)),
                                  child: const Center(child: CircularProgressIndicator()),
                                ),
                          errorBuilder: (_, __, ___) => Container(
                            decoration: BoxDecoration(color: primary.shade100, borderRadius: BorderRadius.circular(14)),
                            child: const Center(child: Icon(Icons.error, color: Colors.red)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // ADD button positioned on top of the hero
                widget.productWithOption
                    ? Positioned(
                        bottom: 5,
                        right: 5,
                        child: Hero(
                          tag: 'add_button_$heroTag', // Separate hero for add button
                          child: CustomElevatedButton(
                            width: 60,
                            height: 28,
                            onPressed:
                                widget.onAddPressed ??
                                () {
                                  if (widget.singleProduct.variants.length > 1) {
                                    _showAddOptionsBottomSheet(
                                      context: context,
                                      variants: widget.singleProduct.variants,
                                      ref: ref,
                                    );
                                  } else {
                                    if (ref.watch(cartProducts).isNotEmpty) {
                                      var addedProduct = ref.watch(cartProducts).indexWhere(
                                        (e) =>
                                            e.productName == widget.singleProduct.name &&
                                            e.size == widget.singleProduct.variants.first.size,
                                      );
                                      if (addedProduct != -1) {
                                        var updated = ref.watch(cartProducts)[addedProduct].copyWith(
                                          quantity: ref.watch(cartProducts)[addedProduct].quantity + 1,
                                        );
                                        ref.watch(cartProducts)[addedProduct] = updated;




                                        //-- updating the demo product quantity
                                        var product = demoProducts.indexWhere((element) {
                                                                                  return element.name == widget.singleProduct.name;
                                                                                },);
                                        var updateDemoProduct = demoProducts[product].copyWith(
                                            quantity: demoProducts[product].quantity - updated.quantity);
                                        demoProducts[product] = updateDemoProduct;

                                      }else{
                                        ref.watch(cartProducts).add(
                                          CartModel(
                                            productImage: widget.singleProduct.imageUrl,
                                            productName: widget.singleProduct.name,
                                            productPrice: widget.singleProduct.variants.first.price,
                                            productDescription: widget.singleProduct.description,
                                            unit: widget.singleProduct.variants.first.unit,
                                            size: widget.singleProduct.variants.first.size,
                                            quantity: 1,
                                          ),
                                        );
                                      }
                                    } else {
                                      ref.watch(cartProducts).add(
                                        CartModel(
                                          productImage: widget.singleProduct.imageUrl,
                                          productName: widget.singleProduct.name,
                                          productPrice: widget.singleProduct.variants.first.price,
                                          productDescription: widget.singleProduct.description,
                                          unit: widget.singleProduct.variants.first.unit,
                                          size: widget.singleProduct.variants.first.size,
                                          quantity: 1,
                                        ),
                                      );
                                    }
                                  }
                                },
                            isTransparent: true,
                            borderColor: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppStringConstants.add, style: textExtraBoldContent10.copyWith(color: primary.shade500)),
                                Text('options', style: textSemiContent8.copyWith(color: primary.shade500)),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Positioned(
                        bottom: 5,
                        right: 5,
                        child: Hero(
                          tag: 'add_button_$heroTag', // Separate hero for add button
                          child: CustomElevatedButton(
                            width: 50,
                            height: 22,
                            onPressed: widget.onAddPressed,
                            isTransparent: true,
                            borderColor: Colors.transparent,
                            child: Text('ADD', style: textExtraBoldContent10.copyWith(color: primary.shade500)),
                          ),
                        ),
                      ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          /// Tags: Quantity and Title
          SizedBox(
            width: context.screenWidth * 0.35,
            child: Row(
              spacing: 3,
              children: [
                _buildTag(ref.watch(grossItemQuantity) == 0 ? '1' : ref.watch(grossItemQuantity).toString(), 45),
                Expanded(child: _buildTag(widget.singleProduct.name, context.screenWidth * 0.35 - 55)),
              ],
            ),
          ),

          const SizedBox(height: 5),

          /// Subtitle
          SizedBox(
            width: context.screenWidth * 0.35,
            child: Text(
              widget.singleProduct.description,
              style: textSemiContent10.copyWith(color: widget.isBg ? primary.shade300 : primary.shade500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          /// Offer
          SizedBox(
            width: context.screenWidth * 0.35,
            child: Text(
              '${widget.singleProduct.variants.first.discountPercentage}% off',
              style: textSemiContent8.copyWith(
                color: widget.isBg ? primary.shade300 : primary.shade500,
                fontWeight: FontWeight.w600,
                fontSize: 7,
              ),
            ),
          ),

          /// Price
          SizedBox(
            width: context.screenWidth * 0.35,
            child: Text(
              '₹${widget.singleProduct.variants.first.price} MRP',
              style: textSemiContent10.copyWith(color: widget.isBg ? primary.shade300 : primary.shade500),
            ),
          ),

          /// Timer Row
          SizedBox(
            width: context.screenWidth * 0.35,
            child: Row(
              children: [
                SvgPicture.asset(AssetConstants.timer, width: 10),
                const SizedBox(width: 4),
                Text(
                  '8',
                  style: textSemiContent8.copyWith(
                    color: widget.isBg ? primary.shade300 : primary.shade500,
                    fontWeight: FontWeight.w600,
                    fontSize: 6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, double width) {
    return Container(
      width: width,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.isBg ? primary.shade300 : primary.shade700,
      ),
      child: Center(
        child: Text(
          text.toString(),
          style: textExtraBoldContent10.copyWith(color: primary.shade500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  //-- bottom sheet
  void _showAddOptionsBottomSheet({
    required BuildContext context,
    required List<ProductVariant> variants,
    required WidgetRef ref,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: context.screenHeight * 0.4,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: ListView.builder(
            itemCount: variants.length,
            itemBuilder: (context, index) {
              return ProductCard(
                productVariant: widget.singleProduct.variants[index],
                quantity: variants[index].quantity.toString(),
                imageUrl: variants[index].imageUrl,
                title: widget.singleProduct.name,
                subtitle: widget.singleProduct.description,
                price: variants[index].price,
                originalPrice: variants[index].originalPrice,
                onAddToCart: () {
                  if (ref.watch(cartProducts).isEmpty) {
                    ref.watch(cartProducts).add(
                      CartModel(
                        productImage: widget.singleProduct.imageUrl,
                        productName: widget.singleProduct.name,
                        productPrice: widget.singleProduct.variants[index].price,
                        productDescription: widget.singleProduct.description,
                        unit: widget.singleProduct.variants[index].unit,
                        size: widget.singleProduct.variants[index].size,
                        quantity: 1,
                      ),
                    );
                  } else {
                    final addedProduct = ref.watch(cartProducts).indexWhere(
                      (element) => element.productName == widget.singleProduct.name && element.size == variants[index].size,
                    );
                    if (addedProduct != -1) {
                      var updated = ref.watch(cartProducts)[addedProduct].copyWith(quantity: ref.watch(cartProducts)[addedProduct].quantity + 1);
                      ref.watch(cartProducts)[addedProduct] = updated;

                      //-- updating the demo product quantity

                      var product = demoProducts.indexWhere((element) {
                        return element.name == widget.singleProduct.name;
                      },);
                      var updateDemoProduct =   demoProducts[product].copyWith(quantity: demoProducts[product].quantity - 1);
                      demoProducts[product] = updateDemoProduct;
                      print(demoProducts[product].quantity);


                      for (ProductModel a in demoProducts) {
                        ref.watch(grossItemQuantity.notifier).state = 0;
                        print('s');
                          if (widget.singleProduct.variants.length > 1) {
                            ref.watch(grossItemQuantity.notifier).state += a.quantity;
                          } else {
                            ref.watch(grossItemQuantity.notifier).state += a.quantity;
                          }

                      }
                    } else {
                      ref.watch(cartProducts).add(
                        CartModel(

                          productImage: widget.singleProduct.imageUrl,
                          productName: widget.singleProduct.name,
                          productPrice: widget.singleProduct.variants[index].price,
                          productDescription: widget.singleProduct.description,
                          unit: widget.singleProduct.variants[index].unit,
                          size: widget.singleProduct.variants[index].size,
                          quantity: 1,
                        ),
                      );
                    }
                  }
                },
                onQuantityChanged: (quantity) {
                  print('Quantity changed: $quantity');
                },
              );
            },
          ),

          // Column(
          //   mainAxisSize: MainAxisSize.min,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     // Handle bar
          //     Center(
          //       child: Container(
          //         width: context.screenWidth * 0.5,
          //         height: 4,
          //         decoration: BoxDecoration(
          //           color: primary.shade500,
          //           borderRadius: BorderRadius.only(
          //             bottomLeft: Radius.circular(50),
          //             bottomRight: Radius.circular(50),
          //           ),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(height: 20),

          //     // Title
          //     ProductCard(
          //       imageUrl:
          //           'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0',
          //       title: 'Ashirvad 0% malda',
          //       subtitle: '100% mp atta',
          //       price: 525,
          //       originalPrice: 700,
          //       onAddToCart: () {
          //         // ref.watch(cartProducts).add();
          //         print('Product added to cart');
          //       },
          //       onQuantityChanged: (quantity) {
          //         print('Quantity changed: $quantity');
          //       },
          //     ),
          //     ProductCard(
          //       imageUrl:
          //           'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0',
          //       title: 'Ashirvad 0% malda',
          //       subtitle: '100% mp atta',
          //       price: 525,
          //       originalPrice: 700,
          //       onAddToCart: () {
          //         print('Product added to cart');
          //       },
          //       onQuantityChanged: (quantity) {
          //         print('Quantity changed: $quantity');
          //       },
          //     ),

          //     // Bottom padding for safe area
          //     SizedBox(height: MediaQuery.of(context).padding.bottom),
          //   ],
          // ),
        );
      },
    );
  }
}

//-- bottom sheet product card
class ProductCard extends ConsumerStatefulWidget {
  final ProductVariant productVariant;
  final String imageUrl;
  final String title;
  final String subtitle;
  final double price;
  final String quantity;
  final double? originalPrice;
  final VoidCallback? onAddToCart;

  final Function(int quantity)? onQuantityChanged;

  const ProductCard({
    required this.quantity,
    required this.productVariant,
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
    this.originalPrice,
    this.onAddToCart,
    this.onQuantityChanged,
  });

  @override
  ConsumerState<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends ConsumerState<ProductCard> {
  bool showQuantityControls = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: NetworkImage(widget.imageUrl), fit: BoxFit.cover),
            ),
          ),

          const SizedBox(width: 12),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  widget.subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      'Qty : 0',
                      style: textBoldContent16.copyWith(color: primary.shade500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.quantity,
                      style: textBoldContent16.copyWith(color: primary.shade500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Price and Action Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Price Section
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '₹${widget.price.toInt()}',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  if (widget.originalPrice != null) ...[
                    const SizedBox(width: 4),
                    Text(
                      'MRP ₹${widget.originalPrice!.toInt()}',
                      style: TextStyle(fontSize: 11, color: Colors.grey[500], decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ],
              ),

              const SizedBox(height: 8),

              // Action Button/Quantity Controls
              showQuantityControls
                  ? _buildQuantityControls(productVariant: widget.productVariant, name: widget.title)
                  : _buildAddButton(ref: ref),
            ],
          ),
        ],
      ),
    );
  }

  //-- add button in bottom sheet

  Widget _buildAddButton({required WidgetRef ref}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF1A237E), // Dark blue color
          width: 1.5,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            showQuantityControls = true;
            ref.watch(addingToCartQuantity.notifier).state = 1;
          });
          widget.onAddToCart?.call();
          widget.onQuantityChanged?.call(1);
        },
        child: const Text(
          'ADD',
          style: TextStyle(color: Color(0xFF1A237E), fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
      ),
    );
  }

  //-- quantity controlls
  Widget _buildQuantityControls({required ProductVariant productVariant, required String name}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(color: const Color(0xFF1A237E), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //-- quantity minus button
          _buildQuantityButton(
            icon: Icons.remove,
            onPressed: () {
              if (ref.watch(addingToCartQuantity) > 0) {
                ref.watch(addingToCartQuantity.notifier).state--;
                var addedProduct = ref.watch(cartProducts).indexWhere((e) => e.productName == name && e.size == productVariant.size);
                if (addedProduct != -1) {
                  var updated = ref.watch(cartProducts)[addedProduct].copyWith(quantity: ref.watch(cartProducts)[addedProduct].quantity - 1);
                  ref.watch(cartProducts)[addedProduct] = updated;
                }
              } else {
                ref.watch(cartProducts.notifier).state = [];
              }
            },
          ),
          //-- quantity text
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              ref.watch(addingToCartQuantity).toString(),
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),

          //-- plus button
          _buildQuantityButton(
            icon: Icons.add,
            onPressed: () {
              if (productVariant.quantity > ref.watch(addingToCartQuantity)) {
                ref.watch(addingToCartQuantity.notifier).state++;
                var addedProduct = ref.watch(cartProducts).indexWhere((e) => e.productName == name && e.size == productVariant.size);
                if (addedProduct != -1) {
                  var updated = ref.watch(cartProducts)[addedProduct].copyWith(quantity: ref.watch(cartProducts)[addedProduct].quantity + 1);
                  ref.watch(cartProducts)[addedProduct] = updated;
                }
              }

              widget.onQuantityChanged?.call(ref.watch(addingToCartQuantity));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({required IconData icon, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(icon, color: const Color(0xFF1A237E), size: 16),
      ),
    );
  }
}
