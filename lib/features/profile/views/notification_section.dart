import 'package:bm_user/core/constants/color_constants.dart';
import 'package:bm_user/core/utils/styles/text_style.dart';
import 'package:bm_user/features/shared/widgets/shadow_container.dart';
import 'package:flutter/material.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //-- showing notifications

            //-- heading tile
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: _buildHeaderTile(headerText: 'Today'),
            ),
            //-- notifications
            _buildAnnouncementCard(announcementText: 'ANNOUNCEMENT', actionText: 'VIEW'),
            _buildAnnouncementCard(announcementText: 'ANNOUNCEMENT', actionText: 'VIEW'),
            _buildAnnouncementCard(announcementText: 'ANNOUNCEMENT', actionText: 'VIEW'),
            //-- heading tile

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: _buildHeaderTile(headerText: 'Week'),
            ),
            //-- notifications
            _buildAnnouncementCard(announcementText: 'ANNOUNCEMENT', actionText: 'VIEW'),
            _buildAnnouncementCard(announcementText: 'ANNOUNCEMENT', actionText: 'VIEW'),
            _buildAnnouncementCard(announcementText: 'ANNOUNCEMENT', actionText: 'VIEW'),
            _buildAnnouncementCard(announcementText: 'ANNOUNCEMENT', actionText: 'VIEW'),
            _buildAnnouncementCard(announcementText: 'ANNOUNCEMENT', actionText: 'VIEW'),
            _buildAnnouncementCard(announcementText: 'ANNOUNCEMENT', actionText: 'VIEW'),
          ],
        ),
      ),
    );
  }

  //-- header tile
  Widget _buildHeaderTile({required String headerText}) {
    return Text(headerText, style: textBold2XContent24.copyWith(color: primary.shade200));
  }

  //-- announcement card
  Widget _buildAnnouncementCard({required String announcementText, required String actionText}) {
    return ShadowContainer(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          //-- announcement text
          Text(announcementText, style: textBold2XContent24.copyWith(color: primary.shade500)),

          //-- view button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: primary.shade300, border: Border.all(), borderRadius: BorderRadius.circular(20)),
            child: Text(actionText, style: textBoldContent14.copyWith(color: primary.shade500)),
          ),
        ],
      ),
    );
  }
}
