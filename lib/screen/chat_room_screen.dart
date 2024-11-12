import 'package:_night_alarm_manager/models/chat_element.dart';
import 'package:_night_alarm_manager/models/user_element.dart';
import 'package:_night_alarm_manager/models/weekly_survey_element.dart';
import 'package:_night_alarm_manager/screen/weekly_mediation_screen.dart';
import 'package:_night_alarm_manager/screen/weekly_survey_screen.dart';
import 'package:_night_alarm_manager/utils/http_util.dart';
import 'package:_night_alarm_manager/widget/chat_widget.dart';
import 'package:flutter/material.dart';

class ChatRoomScreen extends StatefulWidget {
  UserElement user;
  UserElement? viewUser;

  ChatRoomScreen({super.key, required this.user});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    makeUserViewer();
  }

  ChatElement _parseJsonToChatElement(Map<String, dynamic> json) {
    return ChatElement(
      chatId: json['chatId'],
      chatType: json['user']['userType'],
      chatDay: json['alarm']['alarmDays'],
      content: json['user']['userType'] == 'text'
          ? json['alarm']['textContent']
          : json['alarm']['alarmContent'],
      answerList: [
        json['answer']['answer1'] ?? '-1',
        json['answer']['answer2'] ?? '-1',
      ],
    );
  }

  void makeUserViewer() async {
    final List chatList = await HttpUtil.getUserChatList(widget.user.userId);
    final userChatList = chatList
        .map<ChatElement>((json) => _parseJsonToChatElement(json))
        .toList();

    setState(() {
      widget.viewUser = UserElement(
          userName: widget.user.getUserName,
          userId: widget.user.getUserId,
          userPassword: widget.user.userPassword,
          type: widget.user.getUserType,
          userDeviceCode: widget.user.getUserDeviceCode,
          chatList: userChatList,
          weeklySurvey: WeeklySurveyElement(answer: {
            1: [-1]
          }),
          experimentWeek: 1);
    });

    print(
        'userName: ${widget.viewUser!.getUserName}, userpw: ${widget.viewUser!.userPassword}, usertype: ${widget.viewUser!.getUserType}, userDeviceCode: ${widget.viewUser!.getUserDeviceCode}');

    // 페이지가 로드될 때 맨 아래로 스크롤
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewUser == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
        backgroundColor: const Color(0xfffefcfc),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          title: Text(
            '${widget.viewUser!.getUserName} 참여자',
            style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Noto_Sans_KR',
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // 주간 설문 페이지로 이동
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return WeekyMediationScreen(user: widget.viewUser!);
                    },
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      // 실험 주를 세는 속성이 있어야 함.
                      color: Colors.grey),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.edit_document,
                        color: Colors.black,
                        size: 24,
                      ),
                      Text('주간 설문',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        body: Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.viewUser!.chatList.length,
            itemBuilder: (context, index) {
              return ChatWidget(
                  user: widget.viewUser!,
                  chat: widget.viewUser!.chatList[index]);
            },
          ),
        ));
  }

  @override
  void dispose() {
    _scrollController.dispose(); // 컨트롤러 해제
    super.dispose();
  }
}
