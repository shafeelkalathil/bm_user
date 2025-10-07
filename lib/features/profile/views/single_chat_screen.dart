import 'package:bm_user/core/constants/asset_constants.dart';
import 'package:bm_user/core/constants/color_constants.dart';
import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/shared/widgets/shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleChatScreen extends StatelessWidget {
  const SingleChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //-- chat header include the name, online status....
          _ChatHeader(),
          //-- chat messages
          SizedBox(
            height: context.screenHeight * 0.78,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              children: [
                //-- sunday
                Center(
                  child: Text('sunday', style: TextStyle(color: Colors.grey, fontSize: 13)),
                ),

                //-- message tile
                _ChatBubble(text: "Sed ligula erat, dignissim sit amet dictum id?", time: "01:15 PM", isMe: false),
                _ChatBubble(text: "Sed ligula erat,mauris sit eros a viverra amet dictum id?", time: "01:15 PM", isMe: true),

                //-- voice message tile
                _VoiceMessageBubble(time: "01:18 PM", isMe: true),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text('Just Now', style: TextStyle(color: Colors.grey, fontSize: 13)),
                  ),
                ),
                _ChatBubble(text: "Sed ligula erat, dignissim sit amet dictum id?", time: "01:15 PM", isMe: false),
                _ChatBubble(text: "Sed ligula erat,mauris sit eros a viverra amet dictum id?", time: "01:15 PM", isMe: true),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: _MessageInputBar(),
          ),
        ],
      ),
    );
  }
}

//-- user name , active status,...... tile
class _ChatHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 13, right: 13),
      color: Color(0xFF071651),
      child: Column(
        children: [
          SizedBox(height: context.screenHeight * 0.03),
          Row(
            children: [
              //-- arrow back icon
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios_new, color: primary.shade300)),

              //-- profile picture
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              SizedBox(width: context.screenWidth * 0.04),
              //-- name and active status
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //-- name
                    Text(
                      'Quiche Hollandaise',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                    ),

                    //-- active status
                    Row(
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                        ),
                        const SizedBox(width: 5),
                        Text('Active Now', style: TextStyle(color: Colors.white54, fontSize: 13)),
                      ],
                    ),
                  ],
                ),
              ),

              //-- call,
              SvgPicture.asset(AssetConstants.callIcon),
              SizedBox(width: context.screenWidth * 0.02),

              //-- video call icon
              Icon(Icons.videocam_outlined, color: Colors.white, size: 22),
              SizedBox(width: context.screenWidth * 0.02),
              //-- menu icon
              Icon(Icons.menu, color: Colors.white, size: 22),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isMe;

  const _ChatBubble({required this.text, required this.time, this.isMe = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isMe
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: CircleAvatar(radius: 20, backgroundColor: primary.shade100),
                  ),
            isMe ? Text(time, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)) : SizedBox(),

            Expanded(
              child: Align(
                child: Container(
                  margin: EdgeInsets.only(left: isMe ? 10 : 0, right: isMe ? 0 : 10),
                  decoration: BoxDecoration(
                    color: isMe ? Color(0xFF071651) : Colors.grey.shade100,
                    borderRadius: BorderRadius.only(
                      topLeft: isMe ? Radius.circular(15) : Radius.circular(0),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: isMe ? Radius.circular(0) : Radius.circular(15),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 17),
                  child: Text(text, style: TextStyle(color: isMe ? Colors.white : Colors.black87, fontSize: 15.5)),
                ),
              ),
            ),
            SizedBox(height: 2),
            if (isMe) SizedBox() else Text(time, style: TextStyle(fontSize: 11, color: Colors.grey.shade600), softWrap: false),
          ],
        ),
      ),
    );
  }
}

class _VoiceMessageBubble extends StatelessWidget {
  final String time;
  final bool isMe;

  const _VoiceMessageBubble({required this.time, this.isMe = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(time, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                SizedBox(height: 4),

                Container(
                  width: 200,
                  height: 46,
                  decoration: BoxDecoration(color: Color(0xFF071651), borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Icon(Icons.equalizer, color: Colors.white, size: 28),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: LinearProgressIndicator(
                            minHeight: 6,
                            backgroundColor: Colors.white24,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            value: 0.6,
                          ),
                        ),
                      ),
                      Icon(Icons.pause, color: Colors.white, size: 26),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 1),
            Text("Quiche has been listening your voice", style: TextStyle(fontSize: 11.5, color: Colors.grey.shade400)),
          ],
        ),
      ),
    );
  }
}

class _MessageInputBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      borderRadius: 30,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          SizedBox(
            height: context.screenHeight * 0.07,
            width: context.screenWidth * 0.7,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Transform.rotate(
                  angle: 180 * 4 / 180,
                  child: Icon(Icons.attach_file_rounded, color: primary.shade50),
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: "Type a Message",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              ),
            ),
          ),
          VerticalDivider(color: primary.shade50),
          Icon(Icons.mic_none, color: Colors.blue, size: 27),
          SizedBox(width: 13),
          SvgPicture.asset(AssetConstants.sendIcon),
        ],
      ),
    );
  }
}
