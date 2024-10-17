import 'package:_night_alarm_manager/widget/profile_widget.dart';
import 'package:_night_alarm_manager/widget/top_bar.dart';
import 'package:_night_alarm_manager/widget/top_of_profile.dart';
import 'package:flutter/material.dart';

class ManageMain extends StatelessWidget {
  const ManageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: TopBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
        child: Column(
          children: [
            TopOfProfile(
              type: 'Text Group',
            ),
            ProfileWidget(userName: '김경영', userId: 'text-P1'),
            ProfileWidget(userName: '박경영', userId: 'text-P2'),
            TopOfProfile(
              type: 'Voice Group',
            ),
            ProfileWidget(userName: '김경영', userId: 'text-P1'),
            ProfileWidget(userName: '박경영', userId: 'text-P2'),
            TopOfProfile(
              type: 'Video Group',
            ),
            ProfileWidget(userName: '김경영', userId: 'text-P1'),
          ],
        ),
      ),
    );
  }
}
