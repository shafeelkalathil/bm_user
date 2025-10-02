import 'package:bm_user/features/auth/views/your_location_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_string_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/helpers/toast_helper.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../shared/widgets/custom_elevated_button.dart';
import '../../shared/widgets/custom_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  Future<void> _handleVerifyOtp() async {
    FocusScope.of(context).unfocus();

    final otp = otpController.text.trim();

    if (otp.isEmpty) {
      CustomToast.showError(context, 'Please enter the OTP');
      return;
    }

    if (otp.length != 4) {
      CustomToast.showError(context, 'Please enter a valid 4-digit OTP');
      return;
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const YourLocationScreen()),
      );
    }
  }

  Future<void> _handleResendOtp() async {}

  String get maskedPhoneNumber {
    if (widget.phoneNumber.length < 10) return '';
    return '${widget.phoneNumber.substring(0, 3)}*****${widget.phoneNumber.substring(8)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Back button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back_ios, color: primary.shade200),
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// --- Description line 1 ---
                    Text(
                      AppStringConstants.otpScreenDescLine1,
                      style: textExtraBold3XContent24.copyWith(
                        fontSize: 25,
                        color: primary.shade200,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),

                    /// --- Description line 2 ---
                    Text(
                      AppStringConstants.otpScreenDescLine2,
                      style: textExtraBold3XContent24.copyWith(
                        fontSize: 25,
                        color: primary.shade200,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),

                    /// --- Mobile number info ---
                    Text(
                      '${AppStringConstants.pleaseCheckMobile} $maskedPhoneNumber',
                      style: textSemiContent14.copyWith(color: primary.shade50),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),

                    /// --- Additional description ---
                    Text(
                      AppStringConstants.continueToResetYourPassword,
                      style: textSemiContent14.copyWith(color: primary.shade50),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 60),

                    /// --- OTP text field ---
                    CustomOtpTextFormField(
                      controller: otpController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the OTP';
                        }
                        if (value.length != 4) {
                          return 'OTP must be 4 digits';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),

                    /// --- Login button ---
                    CustomElevatedButton(
                      onPressed: _handleVerifyOtp,
                      isTransparent: false,
                      child: Text(
                        AppStringConstants.login,
                        style: textExtraBoldContent16.copyWith(color: primary.shade300),
                      ),
                    ),
                    const SizedBox(height: 40),

                    /// --- Resend code text ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStringConstants.notReceive,
                          style: textBoldContent14.copyWith(color: primary.shade50),
                        ),
                        InkWell(
                          onTap: _handleResendOtp,
                          child: Text(
                            'Resend in ${30}s',
                            style: textBold2XContent14.copyWith(color: primary.shade500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
