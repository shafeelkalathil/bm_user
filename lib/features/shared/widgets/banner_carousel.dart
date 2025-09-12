import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key, required this.sliderImages});

  final List<String> sliderImages;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 165,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            initialPage: 0,
            enlargeCenterPage: false,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemCount: widget.sliderImages.length,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  widget.sliderImages[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        // Dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.sliderImages.asMap().entries.map((entry) {
            final isActive = _currentIndex == entry.key;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? primary.shade500 : Colors.transparent,
                border: Border.all(
                  color: isActive ? primary.shade500 : primary.shade600,
                  width: 1.5,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
