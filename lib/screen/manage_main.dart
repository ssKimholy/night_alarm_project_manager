import 'package:_night_alarm_manager/models/chat_body_element.dart';
import 'package:_night_alarm_manager/models/chat_element.dart';
import 'package:_night_alarm_manager/models/user_element.dart';
import 'package:_night_alarm_manager/widget/profile_widget.dart';
import 'package:_night_alarm_manager/widget/top_bar.dart';
import 'package:_night_alarm_manager/widget/top_of_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ManageMain extends StatelessWidget {
  ManageMain({super.key});

  final List<UserElement> users = [
    UserElement(
        userName: '김경영',
        userId: 'text-P1',
        weeklySurvey: false,
        type: 'Text Group',
        chatList: [
          ChatElement(
              chatType: 'Text Group',
              chatDay: '2024.10.21',
              chatBody: ChatBodyElement(
                  textBody:
                      '충분한 수면이 기억력과 집중력 향상에 도움이 된다는 사실을 알고 계셨나요? 오늘 밤 일찍 잠자리에 들면 상쾌하게 일어나 하루를 시작할 수 있습니다. 수면은 몸의 배터리를 충전하는 것과 같으니까 재충전하는 거 잊지 마세요!',
                  voiceId: 'vnull',
                  videoId: 'vinull'),
              answerList: [-1, -1, -1]),
          ChatElement(
              chatType: 'Text Group',
              chatDay: '2024.10.22',
              chatBody: ChatBodyElement(
                  textBody:
                      '늦게까지 자고 싶은 마음 이해하지만 다음 날 에너지 수준을 떨어뜨릴 수 있습니다. 단 한 시간의 수면 부족도 기분에 영향을 줄 수 있다는 사실을 알고 계셨나요? 내일도 긍정적인 기분을 유지하기 위해 일찍 잠자리에 들어봅시다.',
                  voiceId: 'vnull',
                  videoId: 'vinull'),
              answerList: [-1, -1, -1]),
          ChatElement(
              chatType: 'Text Group',
              chatDay: '2024.10.23',
              chatBody: ChatBodyElement(
                  textBody:
                      '숙면은 신진대사를 조절하여 건강을 유지하는 데 도움이 됩니다. 일찍 잠자리에 들수록 몸이 치유하고 회복하는 데 더 많은 시간을 줄 수 있습니다. 오늘 몸이 재충전하는 데 필요한 시간을 주세요.',
                  voiceId: 'vnull',
                  videoId: 'vinull'),
              answerList: [-1, -1, -1])
        ]),
    UserElement(
        userName: '박경영',
        userId: 'text-P2',
        weeklySurvey: false,
        type: 'Text Group',
        chatList: []),
    UserElement(
        userName: '이경영',
        userId: 'voice-P1',
        weeklySurvey: false,
        type: 'Voice Group',
        chatList: [
          ChatElement(
              chatType: 'Voice Group',
              chatDay: '2024.10.21',
              chatBody: ChatBodyElement(
                  textBody: '', voiceId: 'v0', videoId: 'vinull'),
              answerList: [-1, -1, -1])
        ]),
    UserElement(
        userName: '황경영',
        userId: 'voice-P2',
        weeklySurvey: false,
        type: 'Voice Group',
        chatList: []),
    UserElement(
        userName: '유경영',
        userId: 'Video-P1',
        weeklySurvey: false,
        type: 'Video Group',
        chatList: [
          ChatElement(
              chatType: 'Video Group',
              chatDay: '2024.10.21',
              chatBody: ChatBodyElement(
                  textBody: '', voiceId: 'vnull', videoId: 'vi0'),
              answerList: [-1, -1, -1])
        ])
  ];

  List<Widget> classifyUser(List<UserElement> userList, String type) {
    return userList
        .where((user) => user.getUserType == type)
        .map((user) => ProfileWidget(
              user: user,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      appBar: const TopBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
          child: Column(
            children: [
              const TopOfProfile(
                type: 'Text Group',
              ),
              Column(children: classifyUser(users, 'Text Group')),
              const TopOfProfile(
                type: 'Voice Group',
              ),
              Column(children: classifyUser(users, 'Voice Group')),
              const TopOfProfile(
                type: 'Video Group',
              ),
              Column(children: classifyUser(users, 'Video Group')),
            ],
          ),
        ),
      ),
    );
  }
}
