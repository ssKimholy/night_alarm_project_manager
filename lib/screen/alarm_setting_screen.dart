import 'dart:ffi';
import 'dart:io';

import 'package:_night_alarm_manager/widget/alarm_days_widget.dart';
import 'package:_night_alarm_manager/widget/alarm_time_widget.dart';
import 'package:_night_alarm_manager/widget/text_message_input_widget.dart';
import 'package:flutter/material.dart';

class AlarmSettingScreen extends StatefulWidget {
  final String type;
  late String alarmTime;
  late String textMessage;
  late List<String> alarmDays = [];
  late File? selectedFile = File('');

  AlarmSettingScreen({
    super.key,
    required this.type,
    this.alarmTime = '',
    this.textMessage = '',
  });

  @override
  State<AlarmSettingScreen> createState() => _AlarmSettingScreenState();
}

class _AlarmSettingScreenState extends State<AlarmSettingScreen> {
  void setAlarmTime(String time) {
    setState(() {
      widget.alarmTime = time;
    });
  }

  void setAlarmDays(String day) {
    setState(() {
      widget.alarmDays.contains(day)
          ? widget.alarmDays.remove(day)
          : widget.alarmDays.add(day);
    });
  }

  void setTextMessage(String message) {
    setState(() {
      widget.textMessage = message;
    });
  }

  void setSelectedFile(File file) {
    setState(() {
      widget.selectedFile = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 22,
          ),
        ),
        title: Text(
          '${widget.type} Setting',
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Noto_Sans_KR',
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              AlarmTime(setAlarmTime: setAlarmTime),
              const SizedBox(
                height: 5.0,
              ),
              AlarmDaysWidget(
                alarmDays: widget.alarmDays,
                setAlarmDays: setAlarmDays,
              ),
              MessageInputWidget(
                type: widget.type,
                textMessage: widget.textMessage,
                setTextMessage: setTextMessage,
                setSelectedFile: setSelectedFile,
              ),
              widget.selectedFile == null
                  ? const SizedBox()
                  : Text(widget.selectedFile!.path,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Noto_Sans_KR',
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: () {
                  // submit code
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 7.0),
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: const Color(0xff3ad277)),
                  child: const Text(
                    '작성 완료',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Noto_Sans_KR',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
