import 'package:bm_user/core/constants/color_constants.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/profile/views/single_chat_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../shared/models/chat_model.dart';
import '../../shared/widgets/shadow_container.dart';

class ChatSection extends StatelessWidget {
  final List<ChatModel> chatData;

  const ChatSection({super.key, required this.chatData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          //-- showing the list of users and chats
          SizedBox(
            height: context.screenHeight * 0.7,
            child: ListView.builder(
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SingleChatScreen(),));
                  },
                  child: _buildChatCard(
                    chatText: chatData[index].message,
                    lastSeenText: chatData[index].lastSeen,
                    userName: chatData[index].userName,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  //-- chat card

  Widget _buildChatCard({required String userName, required String chatText, required String lastSeenText}) {
    return ShadowContainer(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [

                //-- user avatar
                CircleAvatar(radius: 35, backgroundColor: Colors.grey.shade200, child: Icon(Icons.person)),

                //-- user name and last seen
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //-- username
                      Text(userName, style: textBold2XContent18),

                      //-- message
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(chatText, style: textSemiContent14.copyWith(color: primary.shade100)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //-- last seen text
          Text(lastSeenText, style: textSemiContent14.copyWith(color: primary.shade50)),
        ],
      ),
    );
  }
}
