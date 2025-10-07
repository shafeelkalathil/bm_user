import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../core/common_variables.dart';
import '../../cart/view/view_cart_screen.dart';
import '../models/cart_model.dart';

class QuantityControls extends ConsumerStatefulWidget {
  final CartModel productVariant;
  final String name;

  const QuantityControls({super.key, required this.productVariant, required this.name});

  @override
  ConsumerState<QuantityControls> createState() => _QuantityControlsState();
}

class _QuantityControlsState extends ConsumerState<QuantityControls> {
  //-- variables
  final addingQuantity = StateProvider((ref) => 1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(addingQuantity.notifier).state = widget.productVariant.quantity;
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: context.screenWidth * 0.25),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(color: const Color(0xFF1A237E), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          //-- quantity minus button
          _buildQuantityButton(
            icon: Icons.remove,
            onPressed: () {
              //-- make the total amount of cart product set to zero
              ref.watch(amountToPay.notifier).state = 0;
              //-- checking the adding quantity is greater than zero
              if (ref.watch(addingQuantity) > 0) {
                //-- decrementing the adding quantity
                ref.watch(addingQuantity.notifier).state--;

                //-- checking if the product is already in the cart

                var addedProduct = ref
                    .watch(cartProducts)
                    .indexWhere((e) => e.productName == widget.name && e.size == widget.productVariant.size);
                if (addedProduct != -1) {
                  //-- if the product is already in the cart, decrement the quantity
                  var updated = ref
                      .watch(cartProducts)[addedProduct]
                      .copyWith(quantity: ref.watch(cartProducts)[addedProduct].quantity - 1);
                  ref.watch(cartProducts)[addedProduct] = updated;
                }
              } else {
                //-- if the product is not in the cart, remove it from the cart products
                ref.watch(cartProducts.notifier).state = [];
              }

              //-- calculating the total amount to pay
              for (var a in ref.watch(cartProducts)) {
                ref.watch(amountToPay.notifier).state += a.productPrice * a.quantity;
              }
            },
          ),
          //-- quantity text
          Consumer(
            builder: (context, ref, child) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  ref.watch(addingQuantity).toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),

          //-- plus button
          _buildQuantityButton(
            icon: Icons.add,
            onPressed: () {

              //-- make the total amount of cart product set to zero
              ref.watch(amountToPay.notifier).state = 0;
              //-- incrementing the adding quantity
              ref.watch(addingQuantity.notifier).state++;
              //-- checking if the product is already in the cart
              // if (ref.watch(addingQuantity) == 0) {
              //   var addedProduct = ref
              //       .watch(cartProducts)
              //       .indexWhere((e) => e.productName == widget.name && e.size == widget.productVariant.size);
              //   //-- if the product is not in the cart, add it to the cart products
              //   if (addedProduct != 1) {
              //     ref.watch(cartProducts).removeAt(addedProduct);
              //   }
              // }
              //-- checking if the product is already in the cart
              var addedProduct = ref
                  .watch(cartProducts)
                  .indexWhere((e) => e.productName == widget.name && e.size == widget.productVariant.size);
              //-- if the product is already in the cart, increment the quantity
              if (addedProduct != -1) {
                var updated = ref
                    .watch(cartProducts)[addedProduct]
                    .copyWith(quantity: ref.watch(cartProducts)[addedProduct].quantity + 1);
                ref.watch(cartProducts)[addedProduct] = updated;
              }
              //-- calculate the amount to pay

              for (var a in ref.watch(cartProducts)) {
                ref.watch(amountToPay.notifier).state += a.productPrice * a.quantity;
              }

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
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(icon, color: const Color(0xFF1A237E), size: context.screenHeight * 0.028),
      ),
    );
  }
}
