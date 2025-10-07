import 'package:bm_user/core/utils/extensions/size_extension.dart';
import 'package:bm_user/features/shared/widgets/custom_app_bar.dart';
import 'package:bm_user/features/shared/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../shared/widgets/custom_rectangle_button.dart';
import '../../shared/widgets/historyCard.dart';

class ActivityAndHistory extends ConsumerStatefulWidget {
  const ActivityAndHistory({super.key});

  @override
  ConsumerState<ActivityAndHistory> createState() => _ActivityAndHistoryState();
}

class _ActivityAndHistoryState extends ConsumerState<ActivityAndHistory> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _currentIndex = StateProvider((ref) => 0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bottomWidget: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Consumer(
            builder: (context, ref, child) {
              return Row(
                children: [
                  SizedBox(width: 10),
                  //-- activity and history tab buttons
                  Expanded(
                    child: CustomElevatedButton(
                      isTransparent: true,
                      foregroundColor: ref.watch(_currentIndex) == 0 ? primary.shade500 : primary.shade100,
                      backGroundColor: ref.watch(_currentIndex) == 0 ? primary.shade500 : primary.shade100,
                      borderColor: ref.watch(_currentIndex) == 0 ? primary.shade500 : primary.shade100,
                      onPressed: () {
                        ref.watch(_currentIndex.notifier).state = 0;
                      },
                      child: Text(
                        'Activity',
                        style: textBold2XContent16.copyWith(
                          color: ref.watch(_currentIndex) == 0 ? primary.shade300 : primary.shade200,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomElevatedButton(
                      isTransparent: true,
                      foregroundColor: ref.watch(_currentIndex) == 1 ? primary.shade500 : primary.shade100,
                      borderColor: ref.watch(_currentIndex) == 1 ? primary.shade500 : primary.shade100,
                      backGroundColor: ref.watch(_currentIndex) == 1 ? primary.shade500 : primary.shade100,
                      onPressed: () {
                        ref.watch(_currentIndex.notifier).state = 1;
                      },
                      child: Text(
                        'History',
                        style: textBold2XContent16.copyWith(
                          color: ref.watch(_currentIndex) == 1 ? primary.shade300 : primary.shade200,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              );
            },
          ),
        ),

        title: 'Activity & History',
        trailing: Padding(padding: const EdgeInsets.only(right: 20), child: Icon(Icons.search)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //-- showing the history, scheduled, draft, cancelled.... section if  history is selected
                ref.watch(_currentIndex) == 1? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('HISTORY', style: textBold2XContent14.copyWith(color: primary.shade50)),
                      ),
                      Expanded(
                        child: Text('SCHEDULED', style: textBold2XContent14.copyWith(color: primary.shade50), softWrap: false),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('DRAFT', style: textBold2XContent14.copyWith(color: primary.shade50), softWrap: false),
                        ),
                      ),
                      Expanded(
                        child: Text('CANCELLED', style: textBold2XContent14.copyWith(color: primary.shade50), softWrap: false),
                      ),
                    ],
                  ),
                ):SizedBox(),
                //-- transp , e-service ......
                Row(
                  children: [
                    Expanded(
                      child: CustomRectangleButton(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: context.screenWidth * 0.005),
                        onTap: () {},
                        text: 'TRANSP',
                        textstyle: textExtraBoldContent12,
                        color: primary.shade100,
                      ),
                    ),

                    SizedBox(width: 5),
                    Expanded(
                      child: CustomRectangleButton(
                        onTap: () {},
                        text: 'E-SERVE',
                        textstyle: textExtraBoldContent12,
                        color: primary.shade100,
                      ),
                    ),
                    SizedBox(width: 5),

                    Expanded(
                      child: CustomRectangleButton(
                        onTap: () {},
                        color: primary.shade100,
                        borderRadius: 10,
                        text: 'DELIVER',
                        textstyle: textExtraBoldContent12,
                      ),
                    ),
                    SizedBox(width: 5),

                    Expanded(
                      child: CustomRectangleButton(
                        onTap: () {},
                        text: 'WORKER',
                        textstyle: textExtraBoldContent12,
                        color: primary.shade100,
                      ),
                    ),
                  ],
                ),

                //-- tab bar of activity and history
                SizedBox(
                  height: context.screenHeight * 0.7,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      //-- showing the history data of activity
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: context.screenHeight * 0.4,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return ProductHistoryCard(
                              productName: 'Pepsi',
                              productPrice: '30',
                              productActualPrice: '45',
                              productDescription: 'make cool in this hot weather',
                            );
                          },
                        ),
                      ),

                      //-- showing the history data of history
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: context.screenHeight * 0.7,
                        child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return ProductHistoryCard(
                              productName: 'Lays',
                              productPrice: '20',
                              productActualPrice: '30',
                              productDescription: 'High quality chips',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
