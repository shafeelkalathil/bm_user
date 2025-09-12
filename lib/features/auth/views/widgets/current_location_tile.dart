import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_string_constants.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/styles/text_style.dart';

class CurrentLocationTile extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTap;

  const CurrentLocationTile({
    super.key,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Row(
        children: [
          _buildIcon(),
          const SizedBox(width: 10),
          Expanded(child: _buildText()),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            primary?.shade600 ?? Colors.blue.shade600,
          ),
        ),
      );
    }

    return SvgPicture.asset(
      AssetConstants.path,
      width: 20,
      height: 20,
    );
  }

  Widget _buildText() {
    return Text(
      isLoading ? 'Getting current location...' : AppStringConstants.useMyCurrentLocation,
      style: textExtraBoldContent20?.copyWith(
        color: primary.shade200 ?? Colors.blue.shade200,
      ) ?? TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primary?.shade200 ?? Colors.blue.shade200,
      ),
    );
  }

  Widget _buildArrow() {
    return Icon(
      Icons.arrow_forward_ios,
      color: primary?.shade400 ?? Colors.blue.shade400,
      size: 16,
    );
  }
}
