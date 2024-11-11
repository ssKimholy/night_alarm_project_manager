import 'package:_night_alarm_manager/models/chat_element.dart';
import 'package:_night_alarm_manager/models/user_element.dart';
import 'package:_night_alarm_manager/screen/weekly_mediation_screen.dart';
import 'package:_night_alarm_manager/screen/weekly_survey_screen.dart';
import 'package:_night_alarm_manager/widget/chat_widget.dart';
import 'package:flutter/material.dart';

class ChatRoomScreen extends StatefulWidget {
  UserElement user;

  ChatRoomScreen({super.key, required this.user});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // 페이지가 로드될 때 맨 아래로 스크롤
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffefcfc),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          title: Text(
            '${widget.user.getUserName} 참여자',
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
                      return WeekyMediationScreen(user: widget.user);
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
            itemCount: widget.user.chatList.length,
            itemBuilder: (context, index) {
              return ChatWidget(
                  user: widget.user, chat: widget.user.chatList[index]);
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
