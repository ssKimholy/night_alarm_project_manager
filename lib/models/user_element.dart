import 'package:_night_alarm_manager/models/chat_element.dart';

class UserElement {
  String userName;
  String userId;
  bool weeklySurvey;
  String type;
  List<ChatElement> chatList;

  UserElement({
    required this.userName,
    required this.userId,
    required this.weeklySurvey,
    required this.type,
    required this.chatList,
  });

  String get getUserName => userName;
  String get getUserId => userId;
  bool get getWeeklySurvey => weeklySurvey;
  String get getUserType => type;
  List<ChatElement> get getChatList => chatList;
}
