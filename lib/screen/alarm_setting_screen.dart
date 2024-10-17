import 'dart:ffi';

import 'package:_night_alarm_manager/widget/alarm_days_widget.dart';
import 'package:_night_alarm_manager/widget/alarm_time_widget.dart';
import 'package:flutter/material.dart';

class AlarmSettingScreen extends StatefulWidget {
  final String type;
  late String alarmTime;
  late List<String> alarmDays = [];

  AlarmSettingScreen({
    super.key,
    required this.type,
    this.alarmTime = '',
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
      body: Column(
        children: [
          AlarmTime(setAlarmTime: setAlarmTime),
          const SizedBox(
            height: 5.0,
          ),
          AlarmDaysWidget(
            alarmDays: widget.alarmDays,
            setAlarmDays: setAlarmDays,
          )
        ],
      ),
    );
  }
}
