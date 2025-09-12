
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_string_constants.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/helpers/toast_helper.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../../core/utils/validators/validators.dart';
import '../../shared/widgets/custom_elevated_button.dart';
import '../../shared/widgets/custom_textformfield.dart';
import 'otp_screen.dart';

class LoginOrSignUpScreen extends StatefulWidget {
  const LoginOrSignUpScreen({super.key});

  @override
  State<LoginOrSignUpScreen> createState() => _LoginOrSignUpScreenState();
}

class _LoginOrSignUpScreenState extends State<LoginOrSignUpScreen> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleContinue() async {
    FocusScope.of(context).unfocus();

    final phoneNumber = phoneController.text.trim();

    if (phoneNumber.isEmpty) {
      CustomToast.showError(context, 'Please enter your mobile number');
      return;
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              phoneNumber: phoneNumber,
            ),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  /// logo
                  _buildStack(context),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// description
                        Text(
                          AppStringConstants.authPageDescLine1,
                          style: textBoldContent12.copyWith(
                            fontSize: 13,
                            color: primary.shade50,
                          ),
                        ),
                        const SizedBox(height: 8),

                        /// description
                        Text(
                          AppStringConstants.authPageDescLine2,
                          style: textBoldContent12.copyWith(
                            fontSize: 13,
                            color: primary.shade50,
                          ),
                        ),
                        const SizedBox(height: 40),

                        /// login heading
                        Text(
                          AppStringConstants.loginOrSignUp,
                          style: textExtraBoldContent16.copyWith(
                            color: primary.shade500,
                          ),
                        ),
                        const SizedBox(height: 24),

                        /// text form field with validation
                        CustomTextFormField(
                          hintText: AppStringConstants.enterMobileNumber,
                          prefix: Text(
                            '+91  ',
                            style: textExtraBoldContent16.copyWith(
                              color: primary.shade200,
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) =>
                              AppValidators.validatePhone(value),
                        ),
                        const SizedBox(height: 20),

                        /// continue button with loading state
                        CustomElevatedButton(
                          onPressed: _handleContinue,
                          isTransparent: false,
                          child: Text(
                            AppStringConstants.continueText,
                            style: textExtraBoldContent16.copyWith(
                              color: primary.shade300,
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
        ],
      ),
    );
  }

  Widget _buildStack(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AssetConstants.shapedLoginOrSignup,
          width: context.screenWidth,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.only(top: context.screenHeight * 0.3),
          child: Center(child: SvgPicture.asset(AssetConstants.logo)),
        ),
      ],
    );
  }
}
