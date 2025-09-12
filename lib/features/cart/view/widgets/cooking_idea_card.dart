import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/styles/text_style.dart';

class CookingIdeaCard extends StatelessWidget {

  const CookingIdeaCard({super.key, required this.title, required this.imageUrl, this.onTap});

  final String imageUrl;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image and ADD button
          Container(
            width: context.screenWidth * 0.35,
            height: context.screenWidth * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) =>
                progress == null
                    ? child
                    : const Center(child: CircularProgressIndicator()),
                errorBuilder: (_, __, ___) =>
                const Center(child: Icon(Icons.error, color: Colors.red)),
              ),
            ),
          ),

          const SizedBox(height: 6),

          /// Title
          SizedBox(
            width: context.screenWidth * 0.35,
            child: Text(
              title,
              style: textSemiContent10.copyWith(
                color:  primary.shade500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

        ],
      ),
    );
  }
}