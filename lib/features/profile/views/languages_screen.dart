import 'package:bm_user/core/constants/asset_constants.dart';
import 'package:bm_user/core/constants/color_constants.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/core/utils/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/widgets/custom_app_bar.dart';

class LanguagesScreen extends StatelessWidget {
  LanguagesScreen({super.key});

  final List<String> nativeLanguages = ['മലയാളം', "తెలుగు", "தமிழ்", "English", "ಕನ್ನಡ", "हिंदी", "বাংলা", "मराठी"];
  final List<String> translatedLanguages = ['Malayalam', "Telugu", "Tamil", "English", "Kannada", "Hindi", "Bengali", "Marathi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Language'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //-- search field
                FormField(
                  builder: (field) {
                    return TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, size: 30),
                        suffixIcon: Icon(Icons.close),
                        prefixIconColor: primary.shade500,
                        hintText: 'Select Language',
                        hintStyle: textSemiContent14.copyWith(color: primary.shade50),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                      ),
                    );
                  },
                ),

                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: context.screenHeight * 0.8,
                  child: ListView.builder(
                    itemCount: nativeLanguages.length,
                    itemBuilder: (context, index) {
                      return _buildLanguageTile(
                        nativeLanguage: nativeLanguages[index],
                        translatedLanguage: translatedLanguages[index],
                        context: context,
                      );
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

  Widget _buildLanguageTile({required String nativeLanguage, required String translatedLanguage, required BuildContext context}) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          SvgPicture.asset(AssetConstants.languageIcon, height: context.screenHeight * 0.06),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Text(nativeLanguage, style: textBoldContent24.copyWith(color: primary.shade200)),
                Text(translatedLanguage, style: textSemiContent20.copyWith(color: primary.shade50)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
