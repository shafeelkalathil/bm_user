import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/shared/widgets/custom_app_bar.dart';
import 'package:bm_user/features/shared/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../models/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedVariantIndex = 0;
  int quantity = 1;
  bool isFavorite = false;
  bool showQuantitySelector = false;

  // Image slider variables
  PageController _pageController = PageController();
  int currentImageIndex = 0;

  ProductVariant get selectedVariant => widget.product.variants[selectedVariantIndex];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.product.name),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageSlider(),
                  _buildProductInfo(),
                  const SizedBox(height: 15),
                  if (widget.product.hasMultipleOptions?? false?? false) _buildVariantSelector(),
                  const SizedBox(height: 15),
                  _buildProductDescription(),
                  const SizedBox(height: 100), // Space for bottom button
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSlider() {
    // Assuming product has multiple images - you'll need to modify Product model
    // For now, using the same image multiple times as example
    List<String> productImages = [
      widget.product.imageUrl,
      widget.product.imageUrl, // Replace with actual side images
      widget.product.imageUrl, // Replace with actual back images
      widget.product.imageUrl, // Replace with actual detail images
    ];

    return Column(
      children: [
        Hero(
          tag: 'product_${widget.product.id}',
          child: SizedBox(
            width: double.infinity,
            height: context.screenHeight * 0.35,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentImageIndex = index;
                      });
                    },
                    itemCount: productImages.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        productImages[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
                // Navigation arrows (optional)
                Positioned(
                  left: 10,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: currentImageIndex > 0
                        ? GestureDetector(
                            onTap: () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: currentImageIndex < productImages.length - 1
                        ? GestureDetector(
                            onTap: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Dot indicator
        _buildDotIndicator(productImages.length),
      ],
    );
  }

  Widget _buildDotIndicator(int imageCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        imageCount,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == currentImageIndex ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == currentImageIndex ? primary.shade500 : primary.shade200,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          widget.product.name,
          style: textBold2XContent14.copyWith(color: primary.shade800),
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < widget.product.rating.floor()
                  ? Icons.star
                  : index < widget.product.rating
                  ? Icons.star_half
                  : Icons.star_border,
              size: 20,
              color: Colors.amber,
            );
          }),
        ),
        const SizedBox(height: 12),

        if (!widget.product.hasMultipleOptions!?? false) ...[
          // Main row with price and action button/quantity selector
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Price section
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '₹${1000}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primary.shade500,
                      ),
                    ),
                    if (showQuantitySelector)
                      Text(
                        'Total: ₹${1000 * quantity}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: primary.shade600,
                        ),
                      ),
                  ],
                ),
              ),

              // Action section (Add button or Quantity controls)
              Expanded(
                flex: 2,
                child: showQuantitySelector ? _buildQuantityControls() : _buildAddButton(),
              ),
            ],
          ),
        ],

        // Handle multiple options case
        // if (widget.product.hasMultipleOptions?? false) ...[
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         '₹${selectedVariant.price.toInt()}',
        //         style: TextStyle(
        //           fontSize: 20,
        //           fontWeight: FontWeight.bold,
        //           color: primary.shade500,
        //         ),
        //       ),
        //       showQuantitySelector
        //           ? _buildQuantityControls()
        //           : _buildAddButton(),
        //     ],
        //   ),
        //   if (showQuantitySelector) ...[
        //     const SizedBox(height: 12),
        //     Container(
        //       padding: const EdgeInsets.all(12),
        //       decoration: BoxDecoration(
        //         color: primary.shade50,
        //         borderRadius: BorderRadius.circular(8),
        //         border: Border.all(color: primary.shade200),
        //       ),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             'Total: ₹${selectedVariant.price.toInt() * quantity}',
        //             style: TextStyle(
        //               fontSize: 14,
        //               fontWeight: FontWeight.w600,
        //               color: primary.shade700,
        //             ),
        //           ),
        //           TextButton(
        //             onPressed: () {
        //               setState(() {
        //                 showQuantitySelector = false;
        //                 quantity = 1;
        //               });
        //             },
        //             child: Text(
        //               'Remove',
        //               style: TextStyle(
        //                 fontSize: 12,
        //                 color: primary.shade600,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ],
      ],
    );
  }

  Widget _buildAddButton() {
    return CustomElevatedButton(
      width: 80,
      onPressed: () {
        setState(() {
          showQuantitySelector = true;
        });
      },
      isTransparent: false,
      child: const Text("Add"),
    );
  }

  Widget _buildQuantityControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildQuantityButton(
          icon: Icons.remove,
          onPressed: quantity > 1
              ? () => setState(() => quantity--)
              : () => setState(() {
                  showQuantitySelector = false;
                  quantity = 1;
                }),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: primary.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: primary.shade300),
          ),
          child: Text(
            '$quantity',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primary.shade800,
            ),
          ),
        ),
        _buildQuantityButton(icon: Icons.add, onPressed: () => setState(() => quantity++)),
      ],
    );
  }

  Widget _buildVariantSelector() {
    if (!widget.product.hasMultipleOptions!?? false) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(height: 15),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: List.generate(
            widget.product.variants.length,
            (index) => _buildVariantOption(index),
          ),
        ),
        const SizedBox(height: 15),
        const Divider(),
      ],
    );
  }

  Widget _buildVariantOption(int index) {
    final variant = widget.product.variants[index];
    final isSelected = selectedVariantIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedVariantIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? primary.shade500 : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Colors.transparent : primary.shade500,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${variant.size} ${variant.unit}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : primary.shade800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '₹${variant.price.toInt()}',
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white70 : primary.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedVariantPrice() {
    return Row(
      children: [
        Text('Selected: ', style: TextStyle(fontSize: 14, color: primary.shade800)),
        Text(
          '₹${selectedVariant.price.toInt()}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primary.shade500),
        ),
        if (selectedVariant.hasDiscount) ...[
          const SizedBox(width: 8),
          Text(
            '₹${selectedVariant.originalPrice!.toInt()}',
            style: TextStyle(
              fontSize: 14,
              color: primary.shade800,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildQuantityButton({required IconData icon, required VoidCallback? onPressed}) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: onPressed != null ? primary.shade500 : primary.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: Icon(
            icon,
            color: onPressed != null ? Colors.white : primary.shade800,
            size: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildProductDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text(
          'Product Description',
          style: textExtraBoldContent12.copyWith(color: primary.shade800),
        ),
        const SizedBox(height: 12),
        Text(
          widget.product.description,
          style: textSemiContent12.copyWith(color: primary.shade50),
        ),
      ],
    );
  }
}
