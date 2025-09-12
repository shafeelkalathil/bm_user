import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = ['Filter 1', 'Filter 2', 'Filter 3'];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) => Chip(
          label: Text(filters[index]),
          backgroundColor: primary.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: primary.shade600
            )
          ),
        ),
      ),
    );
  }
}
