import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileWidget extends StatelessWidget {
  final String userName;
  final String userId;

  const ProfileWidget(
      {super.key, required this.userName, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 2.0),
      child: Row(
        children: [
          const Expanded(
            flex: 2,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 24,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Noto_Sans_KR',
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                Text(
                  userId,
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 2.0, vertical: 3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xff3AD277),
                ),
                child: const Text(
                  '채팅방 보기',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
