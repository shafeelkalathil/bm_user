import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';

class ProductCardWithFavIcon extends StatefulWidget {
  final String imageUrl;
  final String title;
  final VoidCallback? onTap;

  const ProductCardWithFavIcon({
    super.key,
    required this.imageUrl,
    required this.title,
    this.onTap,
  });

  @override
  State<ProductCardWithFavIcon> createState() => _ProductCardWithFavIconState();
}

class _ProductCardWithFavIconState extends State<ProductCardWithFavIcon> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.error, size: 20, color: Colors.red),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: toggleFavorite,
                    child: SvgPicture.asset(
                      isFavorite ? AssetConstants.heartFill : AssetConstants.heart,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 120,
            child: Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textSemiContent10.copyWith(color: primary.shade200),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 120,
            child: Row(
              spacing: 5,
              children: [
                SvgPicture.asset(AssetConstants.star),
                Text(
                  '4.7. 30-35 mins',
                  style: textSemiContent8.copyWith(color: primary.shade200),
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          SizedBox(
            width: 120,
            child: Text(
              'Bakery, Dessert, Sweet',
              style: textSemiContent8.copyWith(color: primary.shade200, fontSize: 5),
            ),
          ),
        ],
      ),
    );
  }
}
