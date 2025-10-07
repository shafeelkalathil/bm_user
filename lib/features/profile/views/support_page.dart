import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/profile/views/chat_with_us.dart';
import 'package:bm_user/features/profile/views/faq_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../shared/widgets/custom_app_bar.dart';

class SupporScreen extends ConsumerStatefulWidget {
  const SupporScreen({super.key});

  @override
  ConsumerState<SupporScreen> createState() => _SupporScreenState();
}

class _SupporScreenState extends ConsumerState<SupporScreen> with SingleTickerProviderStateMixin {

  //-- variable
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Support'),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(children: [
          //--  tab bar of notification and chat
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TabBar(
              unselectedLabelColor: primary.shade500,
              controller: _tabController,
              tabs: [

                //-- chat with us tab
                Tab(
                  child: Text('Chat With Us', style: textSemiContent20.copyWith(color: primary.shade500), softWrap: false),
                ),

                //-- faq tab
                Tab(
                  child: Text('FAQ', style: textSemiContent20.copyWith(color: primary.shade500), softWrap: false),
                ),
              ],
            ),
          ),
          //-- tab bar view of chat and notification
          SizedBox(
            height: context.screenHeight * 0.7,
            child: TabBarView(controller: _tabController, children: [Container(
                color: Colors.red,
                child: ChatWithUs()), FaqScreen()]),
          ),
        ],),
      )),
    );
  }
}
