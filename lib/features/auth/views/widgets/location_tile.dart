import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../shared/models/location_search_result.dart';

class LocationTile extends StatelessWidget {
  final LocationSearchResult location;
  final VoidCallback onTap;

  const LocationTile({
    super.key,
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: _buildDecoration(),
        child: Row(
          children: [
            _buildLocationIcon(),
            const SizedBox(width: 12),
            Expanded(child: _buildLocationInfo()),
            _buildArrowIcon(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  Widget _buildLocationIcon() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: primary.shade50 ?? Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.location_on,
        color: primary.shade600 ?? Colors.blue.shade600,
        size: 20,
      ),
    );
  }

  Widget _buildLocationInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (location.placeName?.isNotEmpty == true) ...[
          Text(
            location.placeName!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        Text(
          location.address,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildArrowIcon() {
    return Icon(
      Icons.arrow_forward_ios,
      color: Colors.grey.shade400,
      size: 16,
    );
  }
}