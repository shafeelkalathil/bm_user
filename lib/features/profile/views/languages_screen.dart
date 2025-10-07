import 'package:bm_user/core/constants/asset_constants.dart';
import 'package:bm_user/core/constants/color_constants.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/core/utils/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/widgets/custom_app_bar.dart';

class LanguagesScreen extends ConsumerStatefulWidget {
  LanguagesScreen({super.key});

  @override
  ConsumerState<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends ConsumerState<LanguagesScreen> {
  //-- variables
  final  nativeLanguages = StateProvider((ref) => ['മലയാളം', "తెలుగు", "தமிழ்", "English", "ಕನ್ನಡ", "हिंदी", "বাংলা", "मराठी"]);

  final  translatedLanguages = StateProvider((ref) =>['Malayalam', "Telugu", "Tamil", "English", "Kannada", "Hindi", "Bengali", "Marathi"] );

  final searchController = StateProvider<TextEditingController>((ref) => TextEditingController());

  // final filteredLanguages = StateProvider<List<LanguageModel>>((ref) => []);
  final filteredNativeLanguages = StateProvider<List<String>>((ref) => []);

  final filteredTranslatedLanguages = StateProvider<List<String>>((ref) => []);

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
                      onChanged: (value) {
                        if (ref.watch(searchController).text.isNotEmpty) {
                          print('if 0');
                          var filtered = ref.watch(translatedLanguages).indexWhere((element) {
                            print('if 1');

                            return element.toLowerCase().contains(ref.watch(searchController).text.toLowerCase());
                          });
                          print('if 2');

                          if (filtered != -1) {
                            print('if 3');

                            ref.watch(filteredNativeLanguages).add(ref.watch(nativeLanguages)[filtered]);
                            ref.watch(filteredTranslatedLanguages).add(ref.watch(translatedLanguages)[filtered]);
                            print(ref.watch(filteredNativeLanguages));
                            print(ref.watch(filteredTranslatedLanguages));
                          } else {
                            print('if 4');

                            ref.watch(filteredTranslatedLanguages.notifier).state = [];
                            ref.watch(filteredNativeLanguages.notifier).state = [];
                          }
                        } else {
                          print('if 5');
                          ref.watch(filteredTranslatedLanguages.notifier).state = [];
                          ref.watch(filteredNativeLanguages.notifier).state = [];
                        }
                      },
                      controller: ref.watch(searchController),
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

                Consumer(
                  builder: (context, ref, child) {
                    print('object');
                    print(ref.watch(searchController).text);
                    print(ref.watch(filteredTranslatedLanguages).length);
                    print(ref.watch(filteredTranslatedLanguages));
                    print(ref.watch(filteredNativeLanguages));
                    return Container(
                      margin: EdgeInsets.only(top: 30),
                      height: context.screenHeight * 0.8,
                      child: ListView.builder(
                        itemCount: ref.watch(searchController).text.isNotEmpty
                            ? ref.watch(filteredNativeLanguages).length
                            : ref.watch(nativeLanguages).length,
                        itemBuilder: (context, index) {
                          // print(ref.watch(searchController).text);
                          // print(ref.watch(filteredNativeLanguages).length);
                          // print(ref.watch(filteredNativeLanguages));
                          return ref.watch(searchController).text.isNotEmpty
                              ? _buildLanguageTile(
                                  nativeLanguage: ref.watch(filteredNativeLanguages)[index],
                                  translatedLanguage: ref.watch(filteredTranslatedLanguages)[index],
                                  context: context,
                                )
                              : _buildLanguageTile(
                                  nativeLanguage: ref.watch(nativeLanguages)[index],
                                  translatedLanguage: ref.watch(translatedLanguages)[index],
                                  context: context,
                                );
                        },
                      ),
                    );
                  },
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
