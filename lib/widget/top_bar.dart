import 'package:_night_alarm_manager/screen/add_participant_screen.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: const Text(
        '참여자 목록',
        style: TextStyle(
            color: Colors.black,
            fontFamily: 'Noto_Sans_KR',
            fontSize: 22,
            fontWeight: FontWeight.w600),
      ),
      actions: [
        Container(
          width: 45,
          height: 45,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Color(0xff3AD277),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddParticipantScreen()),
              );
            },
            icon: const Icon(
              Icons.person_add_alt_1,
              color: Colors.white,
              size: 26,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
