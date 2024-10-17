import 'package:_night_alarm_manager/utils/date_time_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmTime extends StatelessWidget {
  final Function setAlarmTime;

  const AlarmTime({super.key, required this.setAlarmTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xfffafafa),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Text(
                '알람 시간',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).copyWith().size.height / 3.5,
            child: CupertinoDatePicker(
              use24hFormat: false,
              mode: CupertinoDatePickerMode.time,
              onDateTimeChanged: (value) {
                setAlarmTime(DateTimeUtils.dateTimeToString(value));
              },
            ),
          ),
          const SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
