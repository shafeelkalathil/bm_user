
import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/styles/text_style.dart';

class SlideToPayButton extends StatefulWidget {
  final double height;
  final double borderRadius;
  final Color sliderColor;
  final String price;
  final VoidCallback onSlideCompleted;

  const SlideToPayButton({
    super.key,
    required this.onSlideCompleted,
    this.height = 60,
    this.borderRadius = 30,
    this.sliderColor = Colors.blue,
    required this.price,
  });

  @override
  State<SlideToPayButton> createState() => _SlideToPayButtonState();
}

class _SlideToPayButtonState extends State<SlideToPayButton> {
  double _dragPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 40; // Padding from sides
    return Container(
      height: widget.height,
      width: width,
      decoration: BoxDecoration(
        color: primary.shade500,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              'Slide to Pay | ${widget.price}',
              style: textExtraBoldContent16.copyWith(
                color: primary.shade300,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 50),
            left: _dragPosition,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _dragPosition += details.delta.dx;
                  _dragPosition = _dragPosition.clamp(0.0, width - widget.height);
                });
              },
              onHorizontalDragEnd: (_) {
                if (_dragPosition > (width - widget.height) * 0.8) {
                  widget.onSlideCompleted();
                }
                setState(() {
                  _dragPosition = 0.0;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: widget.height,
                  height: widget.height,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.sliderColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Icon(Icons.arrow_forward_ios, color: primary.shade50),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}