import 'package:_night_alarm_manager/models/chat_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VoiceChatWidget extends StatefulWidget {
  ChatElement chat;
  bool isPlayed;

  VoiceChatWidget({super.key, required this.chat, this.isPlayed = false});

  @override
  State<VoiceChatWidget> createState() => _VoiceChatWidgetState();
}

class _VoiceChatWidgetState extends State<VoiceChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          padding:
              const EdgeInsets.symmetric(horizontal: 120.0, vertical: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            color: const Color(0xffedeeee),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  if (!widget.isPlayed) {
                    // play voice
                  } else {
                    // stop voice
                  }
                  setState(() {
                    widget.isPlayed = !widget.isPlayed;
                  });
                },
                child: Icon(
                  widget.isPlayed
                      ? Icons.stop_circle_outlined
                      : Icons.play_circle_outline,
                  size: 46,
                  color: const Color(0xff3ad277),
                ),
              ),
              const Text('0:15',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 14,
                      fontWeight: FontWeight.w500))
            ],
          )),
    );
  }
}
