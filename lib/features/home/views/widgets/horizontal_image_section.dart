
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../shared/widgets/section_title.dart';

class HorizontalImageSection extends StatelessWidget {
  final String title;
  final bool withBorder;
  final void Function()? onTap;

  const HorizontalImageSection({super.key, required this.title, this.withBorder = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                  SectionTitle(title: title),
        const SizedBox(height: 12),
        SizedBox(
          height: context.screenHeight * 0.15,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, index) => InkWell(
              onTap: onTap,
              child: Container(
                width: withBorder ? 120 : 85,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: withBorder ? Border.all(color: primary.shade600, width: 1) : null,
                ),
                padding: withBorder ? const EdgeInsets.all(2) : null,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1612810806563-4cb8265db55f?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.1.0',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator(color: Colors.white));
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Icon(Icons.error, size: 20, color: Colors.red));
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}