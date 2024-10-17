import 'package:_night_alarm_manager/screen/alarm_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopOfProfile extends StatelessWidget {
  final String type;

  const TopOfProfile({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              type == 'Text Group'
                  ? Icons.chat_outlined
                  : type == 'Voice Group'
                      ? Icons.mic_none_outlined
                      : Icons.video_chat_outlined,
              color: Colors.black,
              size: 20,
            ),
            const SizedBox(
              width: 3.0,
            ),
            Text(
              type,
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Noto_Sans_KR',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AlarmSettingScreen(type: type)));
          },
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Text(
              '내용 수정',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Noto_Sans_KR',
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
