import 'package:_night_alarm_manager/models/chat_element.dart';
import 'package:_night_alarm_manager/models/weekly_survey_element.dart';

class UserElement {
  String userName;
  String userId;
  String type;
  List<ChatElement> chatList;
  Map<int, WeeklySurveyElement> weeklySurveyList;
  int experimentWeek;

  UserElement({
    required this.userName,
    required this.userId,
    required this.type,
    required this.chatList,
    required this.weeklySurveyList,
    required this.experimentWeek,
  });

  String get getUserName => userName;
  String get getUserId => userId;
  String get getUserType => type;
  List<ChatElement> get getChatList => chatList;
  int get getExperimentWeek => experimentWeek;

  bool isWeeklySurveyComplete(int week) {
    if (weeklySurveyList[week]!.getSleep.contains(-1) ||
        weeklySurveyList[week]!.getPhq.contains(-1)) {
      return false;
    }
    return true;
  }

  WeeklySurveyElement getWeeklySurvey(int week) {
    return weeklySurveyList[week]!;
  }
}
