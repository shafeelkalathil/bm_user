import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/styles/text_style.dart';
import '../../../shared/widgets/shadow_container.dart';

class SelectableChipsRow extends StatefulWidget {
  const SelectableChipsRow({super.key});

  @override
  State<SelectableChipsRow> createState() => _SelectableChipsRowState();
}

class _SelectableChipsRowState extends State<SelectableChipsRow> {
  int selectedIndex = 0;

  final items = ['20', '30', '50', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(items.length, (index) {
        final isSelected = selectedIndex == index;

        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: ShadowContainer(
              bgColor: isSelected ? primary.shade500 : primary.shade300,
              child: Center(
                child: Text(
                  items[index],
                  style: textSemiContent14.copyWith(
                      color: isSelected ? primary.shade300 : primary.shade200
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}