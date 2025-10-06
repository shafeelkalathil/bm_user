import 'package:bm_user/core/constants/asset_constants.dart';
import 'package:bm_user/core/constants/color_constants.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/core/utils/styles/text_style.dart';
import 'package:bm_user/features/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Address'),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: context.screenHeight * 0.85,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                     return _buildAddressCard(context: context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildAddressCard({required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sirajudheen',
                  style: textBold2XContent24.copyWith(color: primary.shade200),
                  softWrap: false,
                ),
                Text(
                  '+91 98959986',
                  style: textSemiContent20.copyWith(color: primary.shade200),
                  softWrap: false,
                ),
                SizedBox(height: context.screenHeight * 0.1),
                Text(
                  'Perumanna 1459,679556',
                  style: textSemiContent20.copyWith(color: primary.shade200),
                  softWrap: false,
                ),
                Text(
                  'Kottakkal,Malappuram',
                  style: textSemiContent20.copyWith(color: primary.shade200),
                  softWrap: false,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: primary.shade300,
                      ),

                      child: SvgPicture.asset(
                        AssetConstants.editIcon,
                        height: context.screenHeight * 0.03,
                        color: primary.shade50,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: primary.shade300,
                      child: SvgPicture.asset(
                        AssetConstants.deleteIcon,
                        height: context.screenHeight * 0.03,
                        color: primary.shade50,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
