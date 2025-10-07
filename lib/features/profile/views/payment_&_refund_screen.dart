import 'package:bm_user/core/constants/asset_constants.dart';
import 'package:bm_user/core/constants/color_constants.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/core/utils/styles/text_style.dart';
import 'package:bm_user/features/shared/widgets/custom_app_bar.dart';
import 'package:bm_user/features/shared/widgets/shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentAndRefundScreen extends StatelessWidget {
  const PaymentAndRefundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment&Refund'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //-- refund heading tile
                _buildHeadingTile(heading: 'Refund Option'),

                //-- no refund container and policy
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  height: context.screenHeight * 0.25,
                  width: context.screenWidth,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.grey.shade100),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), border: Border.all()),
                          child: Text('Refund Policy', style: textSemiContent14),
                        ),
                      ),
                    ],
                  ),
                ),

                //-- payment heading tile
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: _buildHeadingTile(heading: 'Payment Option'),
                ),

                //-- select payment tile
                _buildSubHeadingTile(subHeading: 'Selected Payment', icon: AssetConstants.tickIcon),

                //-- google pay option tile
                _buildPaymentTile(title: 'Google Pay Upi', tileIcon: AssetConstants.googlePayIcon),
                //-- upi subheading  tile
                _buildSubHeadingTile(subHeading: 'Pay By Any Upi App'),
                //-- paytm upi tile
                _buildPaymentTile(

                  actionIcon: Icon(Icons.arrow_forward_ios_rounded,color: primary.shade50,),
                  title: 'Paytm Upi',
                  tileIcon: AssetConstants.paytmIcon,
                ), _buildPaymentTile(
                  actionIcon: Icon(Icons.arrow_forward_ios_rounded,color: primary.shade50,),
                  title: 'PhonePe Upi',
                  tileIcon: AssetConstants.phonePeIcon,
                ), _buildPaymentTile(
                  actionIcon: Icon(Icons.arrow_forward_ios_rounded,color: primary.shade50,),
                  title: 'WhatsApp Upi',
                  tileIcon: AssetConstants.whatsAppIcon,
                ), _buildPaymentTile(
                  actionIcon: Icon(Icons.arrow_forward_ios_rounded,color: primary.shade50,),
                  title: 'Amazon Pay Upi',
                  tileIcon: AssetConstants.amazonPayIcon,
                ),

                _buildSubHeadingTile(subHeading: 'Cards'),

                _buildPaymentTile(
                  title: 'Add Credit Card Or Debit Card',
                  tileIcon: AssetConstants.cardIcon,
                ),

                _buildSubHeadingTile(subHeading: 'Net Banking'),

                _buildPaymentTile(

                  title: 'Net Banking',
                  tileIcon: AssetConstants.bankIcon,
                ),
                _buildSubHeadingTile(subHeading: 'Pay Later'),

                _buildPaymentTile(
                  actionIcon: Icon(Icons.arrow_forward_ios_rounded,color: primary.shade50,),
                  title: 'Pay Later',
                  tileIcon: AssetConstants.payLaterIcon,
                ),
                SizedBox(height: 20,)

              ],
            ),
          ),
        ),
      ),
    );
  }

  //-- heading widget
  Widget _buildHeadingTile({required String heading}) {
    return Text(heading, style: textBold2XContent24.copyWith(color: primary.shade200));
  }

  //-- sub heading widget
  Widget _buildSubHeadingTile({required String subHeading,  String? icon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          Text(subHeading, style: textBoldContent20.copyWith(color: primary.shade200)),
        icon == null? SizedBox():  Padding(padding: const EdgeInsets.only(left: 20), child: SvgPicture.asset(icon)),
        ],
      ),
    );
  }

  //-- payment option widget
  Widget _buildPaymentTile({required String title, required String tileIcon, Widget? actionIcon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ShadowContainer(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                children: [
                  ShadowContainer(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.all(10),
                      child: SvgPicture.asset(tileIcon)),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: SizedBox(
                        width: 180,
                        child: Text(title, style: textBoldContent18.copyWith(color: primary.shade200),softWrap: false,overflow: TextOverflow.ellipsis,)),
                  ),
                ],
              ),
            ),
            actionIcon ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
