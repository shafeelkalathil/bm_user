import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/color_constants.dart' show primary;
import '../../../core/utils/styles/text_style.dart';
import '../../shared/models/chat_model.dart';
import 'chat_section.dart';
import 'notification_section.dart' show NotificationSection;

class NotificationAndChatsScreen extends ConsumerStatefulWidget {
  NotificationAndChatsScreen({super.key});

  @override
  ConsumerState<NotificationAndChatsScreen> createState() => _NotificationAndChatsScreenState();
}

class _NotificationAndChatsScreenState extends ConsumerState<NotificationAndChatsScreen> with SingleTickerProviderStateMixin {
  //-- variables
  final searchController = StateProvider<TextEditingController>((ref) => TextEditingController());
  late TabController _tabController;
  final demoChatData = [
    ChatModel(userName: 'Raghav', lastSeen: 'Today, 8.56pm', message: 'Taxi Service'),
    ChatModel(userName: 'Swathi', lastSeen: 'Today, 10.56 am', message: 'Taxi Service'),
    ChatModel(userName: 'Kiran', lastSeen: 'Yesterday, 8.00am', message: 'Taxi Service'),
    ChatModel(userName: 'Amal', lastSeen: 'Today, 8.00pm', message: 'Taxi Service'),
    ChatModel(userName: 'Jasin', lastSeen: 'Yesterday, 9.00pm', message: 'Taxi Service'),
    ChatModel(userName: 'Athul', lastSeen: 'Today, 7.00am', message: 'Taxi Service'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notification & Chats'),
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
                      onChanged: (value) {},
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

                //-- filter row section
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildFilterWidget(
                          filterText: 'filter',
                          filterIcon: Icon(Icons.tune, size: 20),
                          actionIcon: Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: _buildFilterWidget(
                          filterText: 'filter',
                          filterIcon: Icon(Icons.tune, size: 20),
                          actionIcon: Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                      SizedBox(width: 5),

                      Expanded(
                        child: _buildFilterWidget(
                          filterText: 'filter',
                          filterIcon: Icon(Icons.tune, size: 20),
                          actionIcon: Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                      SizedBox(width: 5),

                      Expanded(
                        child: _buildFilterWidget(
                          filterText: 'filter',
                          filterIcon: Icon(Icons.tune, size: 20),
                          actionIcon: Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                    ],
                  ),
                ),


                //--  tab bar of notification and chat
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TabBar(
                    unselectedLabelColor: primary.shade500,
                    controller: _tabController,
                    tabs: [

                      //-- notification tab
                      Tab(
                        child: Text('Notification', style: textSemiContent20.copyWith(color: primary.shade500), softWrap: false),
                      ),

                      //-- chat tab
                      Tab(
                        child: Text('Chat', style: textSemiContent20.copyWith(color: primary.shade500), softWrap: false),
                      ),
                    ],
                  ),
                ),

                //-- tab bar view of chat and notification
                SizedBox(
                  height: context.screenHeight * 0.7,
                  child: TabBarView(controller: _tabController, children: [Container(
                      color: Colors.red,
                      child: NotificationSection()), ChatSection(chatData: demoChatData,)]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //-- filter Widget
  Widget _buildFilterWidget({required String filterText, required Icon filterIcon, required Icon actionIcon}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: primary.shade300, border: Border.all(), borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: filterIcon),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: FittedBox(child: Text(filterText, style: textSemiContent14, softWrap: false)),
            ),
          ),
          Flexible(
            child: Padding(padding: const EdgeInsets.only(left: 5), child: actionIcon),
          ),
        ],
      ),
    );
  }
}
