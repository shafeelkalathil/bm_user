// import 'package:better_mend_user/features/auth/views/location_manually_screen.dart';
// import 'package:better_mend_user/features/nav_bar/views/bottom_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:better_mend_user/core/constants/app_string_constants.dart';
// import 'package:better_mend_user/core/constants/asset_constants.dart';
// import 'package:better_mend_user/core/constants/color_constants.dart';
// import 'package:better_mend_user/core/utils/styles/text_style.dart';
// import 'package:better_mend_user/features/shared/widgets/custom_elevated_button.dart';
//
//
// class YourLocationScreen extends StatelessWidget {
//   const YourLocationScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//
//                 /// Location icon within a colored circular background
//                 CircleAvatar(
//                   radius: 60,
//                   backgroundColor: primary.shade400,
//                   child: Center(
//                     child: SvgPicture.asset(AssetConstants.location),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//
//                 /// Title text
//                 Text(
//                   AppStringConstants.yourLocation,
//                   style: textExtraBold3XContent30.copyWith(
//                     color: primary.shade200,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//
//                 /// Description lines
//                 Text(
//                   AppStringConstants.yourLocationDescLine1,
//                   style: textBoldContent14.copyWith(
//                     color: primary.shade50,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   AppStringConstants.yourLocationDescLine2,
//                   style: textBoldContent14.copyWith(
//                     color: primary.shade50,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 30),
//
//                 /// Button: Allow Location Access
//                 CustomElevatedButton(
//                   onPressed: () {
//                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const BottomNavBar(),), (route) => false);
//                   },
//                   isTransparent: false,
//                   child: Text(
//                     AppStringConstants.allowLocationAccess,
//                     style: textExtraBoldContent16.copyWith(
//                       color: primary.shade300,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//
//                 /// Button: Enter Location Manually
//                 CustomElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationManuallyScreen(),));
//                   },
//                   isTransparent: true,
//                   child: Text(
//                     AppStringConstants.enterLocationManually,
//                     style: textExtraBoldContent16.copyWith(
//                       color: primary.shade500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:bm_user/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/constants/app_string_constants.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/providers/location_provider.dart';
import '../../../core/utils/helpers/toast_helper.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../nav_bar/views/bottom_nav_bar.dart';
import '../../shared/widgets/custom_elevated_button.dart';
import 'location_manually_screen.dart';

class YourLocationScreen extends StatefulWidget {
  const YourLocationScreen({super.key});

  @override
  State<YourLocationScreen> createState() => _YourLocationScreenState();
}

class _YourLocationScreenState extends State<YourLocationScreen> {
  Future<void> _handleAllowLocation() async {
    final locationProvider = Provider.of<LocationProvider>(context, listen: false);

    final success = await locationProvider.getCurrentLocation();
    storage.setBool('isLoggedIn', true);

    if (success) {
      CustomToast.showSuccess(
        context,
        'Location accessed successfully!\n${locationProvider.shortAddress}',
      );

      // Add slight delay for better UX
      await Future.delayed(const Duration(milliseconds: 1000));

      if (context.mounted) {
        print('navigated');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()),
          (route) => false,
        );
      }
    } else {
      if (locationProvider.errorMessage != null) {
        CustomToast.showError(context, locationProvider.errorMessage!);
      }
    }
  }

  Future<void> _handleManualLocation() async {
    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(builder: (context) => const LocationManuallyScreen()),
    );

    if (result != null) {
      final locationProvider = Provider.of<LocationProvider>(context, listen: false);
      locationProvider.setManualLocation(
        result['latitude'],
        result['longitude'],
        result['address'],
      );

      CustomToast.showSuccess(context, 'Location set manually!');

      await Future.delayed(const Duration(milliseconds: 500));

      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocationProvider>(
        builder: (context, locationProvider, child) {
          return SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Location icon within a colored circular background
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: locationProvider.isLoading
                                ? primary.shade300
                                : primary.shade400,
                            child: locationProvider.isLoading
                                ? SpinKitRipple(color: Colors.white, size: 80.0)
                                : Center(child: SvgPicture.asset(AssetConstants.location)),
                          ),
                        ),
                        const SizedBox(height: 30),

                        /// Title text
                        Text(
                          AppStringConstants.yourLocation,
                          style: textExtraBold3XContent30.copyWith(color: primary.shade200),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),

                        /// Description lines
                        Text(
                          AppStringConstants.yourLocationDescLine1,
                          style: textBoldContent14.copyWith(color: primary.shade50),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          AppStringConstants.yourLocationDescLine2,
                          style: textBoldContent14.copyWith(color: primary.shade50),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),

                        /// Current location display (if available)
                        if (locationProvider.currentAddress != null)
                          Container(
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.green.shade200),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.green.shade600,
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    locationProvider.currentAddress!,
                                    style: TextStyle(
                                      color: Colors.green.shade700,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        /// Button: Allow Location Access
                        CustomElevatedButton(
                          onPressed: locationProvider.isLoading ? null : _handleAllowLocation,
                          isTransparent: false,
                          child: locationProvider.isLoading
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SpinKitThreeBounce(color: primary.shade300, size: 20.0),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Getting Location...',
                                      style: textExtraBoldContent16.copyWith(
                                        color: primary.shade300,
                                      ),
                                    ),
                                  ],
                                )
                              : Text(
                                  AppStringConstants.allowLocationAccess,
                                  style: textExtraBoldContent16.copyWith(
                                    color: primary.shade300,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 15),

                        /// Button: Enter Location Manually
                        CustomElevatedButton(
                          onPressed: locationProvider.isLoading ? null : _handleManualLocation,
                          isTransparent: true,
                          child: Text(
                            AppStringConstants.enterLocationManually,
                            style: textExtraBoldContent16.copyWith(
                              color: locationProvider.isLoading
                                  ? primary.shade300
                                  : primary.shade500,
                            ),
                          ),
                        ),

                        /// Error message display
                        if (locationProvider.errorMessage != null)
                          Container(
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.red.shade200),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.red.shade600,
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    locationProvider.errorMessage!,
                                    style: TextStyle(
                                      color: Colors.red.shade700,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                // Loading overlay
                if (locationProvider.isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
