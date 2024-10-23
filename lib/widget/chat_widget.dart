import 'package:_night_alarm_manager/models/chat_element.dart';
import 'package:_night_alarm_manager/models/user_element.dart';
import 'package:_night_alarm_manager/utils/date_time_util.dart';
import 'package:_night_alarm_manager/widget/text_chat_widget.dart';
import 'package:_night_alarm_manager/widget/video_chat_widget.dart';
import 'package:_night_alarm_manager/widget/voice_chat_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  UserElement user;
  ChatElement chat;

  ChatWidget({super.key, required this.user, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: chat.getIsComplete
                  ? const Color(0xff9decd1).withOpacity(0.7)
                  : const Color(0xffef696b).withOpacity(0.7),
            ),
            child: Text(
                '${chat.chatDay} (${DateTimeUtils.convertDateToWeek(chat.chatDay)})',
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 12,
                    fontWeight: FontWeight.w700)),
          ),
          user.getUserType == 'Text Group'
              ? TextChatWidget(
                  textBody: chat.chatBody.getTextBody,
                )
              : user.getUserType == 'Voice Group'
                  ? VoiceChatWidget(chat: chat)
                  : VideoChatWidget(chat: chat),
          GestureDetector(
            onTap: () {
              // go to survey page
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: chat.getIsComplete
                      ? const Color(0xff9decd1).withOpacity(0.7)
                      : const Color(0xffef696b).withOpacity(0.7),
                ),
                child: chat.getIsComplete
                    ? const Text('설문 완료',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Noto_Sans_KR',
                            fontSize: 14,
                            fontWeight: FontWeight.w500))
                    : const Text('설문 시작',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Noto_Sans_KR',
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
          )
        ],
      ),
    );
  }
}
