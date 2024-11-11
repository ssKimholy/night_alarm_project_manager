import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class HttpUtil {
  static final String URL = dotenv.env['SERVER_IP']!;

  static Future<List<dynamic>> getUsers() async {
    final response = await http.get(
      Uri.parse('$URL/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Fail to get users');
    }
  }

  static Future<void> createTextMessage(String alarmTime,
      List<String> alarmDays, String alarmType, String alarmContent) async {
    print(alarmTime);

    final response = await http.post(
      Uri.parse('$URL/alarm/text/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "alarmTime": alarmTime.split(" ")[1],
        "alarmDays": alarmDays,
        "alarmType": alarmType,
        "alarmContent": alarmContent,
      }),
    );

    if (response.statusCode == 200) {
      print('success!!');
      return;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Fail to create a text message.');
    }
  }

  static Future<void> createVoicetMessage(String alarmTime,
      List<String> alarmDays, String filePath, String alarmName) async {
    print(alarmTime);

    var dio = Dio();
    var formData = FormData.fromMap({
      'alarmTime': alarmTime.split(" ")[1],
      'alarmDays': alarmDays,
      'alarmContent':
          await MultipartFile.fromFile(filePath, filename: alarmName),
      // 다른 form 데이터 추가 가능
    });

    final response = await dio.post('$URL/alarm/voice/create', data: formData);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('okok');
    } else {
      print(response.statusCode);
      print(response.data);
    }
  }
}
