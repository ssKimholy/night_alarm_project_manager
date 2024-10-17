import 'package:flutter/material.dart';

class AlarmDaysWidget extends StatelessWidget {
  final List<String> alarmDays;
  final Function(String) setAlarmDays;

  const AlarmDaysWidget(
      {super.key, required this.alarmDays, required this.setAlarmDays});

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
                '알람 주기',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setAlarmDays('MON');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: alarmDays.contains('MON')
                              ? const Color(0xff3AD277).withOpacity(0.5)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: const Text(
                          '월',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setAlarmDays('TUES');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: alarmDays.contains('TUES')
                              ? const Color(0xff3AD277).withOpacity(0.5)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: const Text(
                          '화',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setAlarmDays('WED');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: alarmDays.contains('WED')
                              ? const Color(0xff3AD277).withOpacity(0.5)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: const Text(
                          '수',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setAlarmDays('THURS');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: alarmDays.contains('THURS')
                              ? const Color(0xff3AD277).withOpacity(0.5)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: const Text(
                          '목',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setAlarmDays('FRI');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: alarmDays.contains('FRI')
                              ? const Color(0xff3AD277).withOpacity(0.5)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: const Text(
                          '금',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setAlarmDays('SAT');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: alarmDays.contains('SAT')
                              ? const Color(0xff3AD277).withOpacity(0.5)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: const Text(
                          '토',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setAlarmDays('SUN');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: alarmDays.contains('SUN')
                              ? const Color(0xff3AD277).withOpacity(0.5)
                              : const Color(0xff898585).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: const Text(
                          '일',
                          style: TextStyle(
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
