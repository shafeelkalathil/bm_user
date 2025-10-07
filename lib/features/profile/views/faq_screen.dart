import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/shared/widgets/shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';

class FaqScreen extends ConsumerWidget {
  FaqScreen({super.key});

  //-- variables
  final searchController = StateProvider<TextEditingController>((ref) => TextEditingController());
  final selectedValue = StateProvider<String?>((ref) => null);



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-- text
            Padding(
              padding: EdgeInsetsGeometry.only(top: 20),
              child: Text(
                "We’re here to help you with\nanything and everyting ",
                style: textSemiContent20.copyWith(color: primary.shade800),
              ),
            ),
            //-- text
            SizedBox(
              width: context.screenWidth,
              child: Padding(
                padding: EdgeInsetsGeometry.only(top: 15),
                child: Flexible(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.",
                    style: textSemiContent20.copyWith(color: primary.shade200),
                  ),
                ),
              ),
            ),

            //-- search field
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: FormField(
                builder: (field) {
                  return ShadowContainer(
                    borderRadius: 30,
                    padding: EdgeInsets.zero,
                    child: TextFormField(
                      onChanged: (value) {},
                      controller: ref.watch(searchController),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, size: 30),
                        prefixIconColor: primary.shade500,
                        hintText: 'Select Language',
                        hintStyle: textSemiContent14.copyWith(color: primary.shade50),
                        fillColor: Colors.grey.shade300,
                        filled: false,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: _buildHeaderTile(headerText: 'FAQ'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: _buildDropDownButton(
                items:['sss','s'],
                onChanged: (p1) {
                  ref.watch(selectedValue.notifier).state = p1.toString();
                },
                value: ref.watch(selectedValue)??"",
              ),
            ),
          ],
        ),
      ),
    );
  }

  //-- header tile
  Widget _buildHeaderTile({required String headerText}) {
    return Text(headerText, style: textBold2XContent24.copyWith(color: primary.shade800));
  }

  //-- dropDown button
  Widget _buildDropDownButton({
    required List<String> items,
    required Function(String?) onChanged,
    String? value,
  }) {
    return DropdownButton<String>(
      value: value,
      hint: Text('Select an option'),
      underline: SizedBox(),
      isExpanded: true,
      items: items.map((e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

}
