import 'package:_night_alarm_manager/models/chat_element.dart';
import 'package:_night_alarm_manager/models/user_element.dart';
import 'package:_night_alarm_manager/models/weekly_survey_element.dart';
import 'package:_night_alarm_manager/utils/http_util.dart';
import 'package:_night_alarm_manager/widget/profile_widget.dart';
import 'package:_night_alarm_manager/widget/top_bar.dart';
import 'package:_night_alarm_manager/widget/top_of_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ManageMain extends StatelessWidget {
  ManageMain({
    super.key,
  });
  final List<UserElement> users = [];

  // here user list initialize

  Future<List<UserElement>> getUsers() async {
    List<dynamic> userData = await HttpUtil.getUsers();
    return userData
        .map((json) => UserElement(
            userName: json["userName"],
            userId: json["userId"],
            userPassword: json["password"],
            type: json["userType"],
            userDeviceCode:
                json["deviceKey"] == null ? "dd" : json["deviceKey"]!,
            chatList: [],
            weeklySurvey: WeeklySurveyElement(answer: {}),
            experimentWeek: 1))
        .toList();
  }

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
    getUsers();
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      appBar: const TopBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
          child: FutureBuilder<List<UserElement>>(
              future: getUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // 데이터 로딩 중일 때 로딩 표시
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // 에러 발생 시 에러 메시지 표시
                  return const Center(child: Text('Failed to load users'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  // 데이터가 없을 때 표시할 위젯
                  return const Center(child: Text('No users found'));
                } else {
                  // 데이터가 성공적으로 로드되었을 때
                  final users = snapshot.data!;

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 15.0),
                      child: Column(
                        children: [
                          const TopOfProfile(
                            type: 'text',
                          ),
                          Column(children: classifyUser(users, 'text')),
                          const TopOfProfile(
                            type: 'voice',
                          ),
                          Column(children: classifyUser(users, 'voice')),
                          const TopOfProfile(
                            type: 'video',
                          ),
                          Column(children: classifyUser(users, 'video')),
                        ],
                      ),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
