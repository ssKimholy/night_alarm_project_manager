import 'dart:convert';
import 'dart:io';

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
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Fail to get users');
    }
  }

  static Future<List<dynamic>> getUserChatList(int id) async {
    final response =
        await http.get(Uri.parse('$URL/chat/$id'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Fail to getUserChatList');
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

  static Future<void> createVoiceMessage(String alarmTime,
      List<String> alarmDays, String filePath, String alarmName) async {
    print(alarmName);

    // Future<String> getFilePath(String filename) async {
    //   final directory = await getApplication
    //   return '${directory.path}/$filename';
    // }

    MultipartFile file = MultipartFile.fromFileSync(filePath,
        filename: alarmName, contentType: DioMediaType.parse('audio/mp3'));
    print(file.contentType);

    var dio = Dio();
    var formData = FormData.fromMap({
      'alarmTime': alarmTime.split(" ")[1],
      'alarmDays': alarmDays,
      'alarmContent': MultipartFile.fromFileSync(filePath,
          filename: alarmName, contentType: DioMediaType.parse('audio/mp3')),
      // 다른 form 데이터 추가 가능
    });

    final response = await dio.post(
      '$URL/alarm/voice/create',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('okok');
    } else {
      print(response.statusCode);
      print(response.data);
    }
  }

  static Future<void> createVideoMessage(String alarmTime,
      List<String> alarmDays, String filePath, String alarmName) async {
    print(alarmName);

    // Future<String> getFilePath(String filename) async {
    //   final directory = await getApplication
    //   return '${directory.path}/$filename';
    // }

    var dio = Dio();
    var formData = FormData.fromMap({
      'alarmTime': alarmTime.split(" ")[1],
      'alarmDays': alarmDays,
      'alarmContent': MultipartFile.fromFileSync(filePath,
          filename: alarmName, contentType: DioMediaType.parse('video/mp4')),
      // 다른 form 데이터 추가 가능
    });

    final response = await dio.post(
      '$URL/alarm/video/create',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('okok');
    } else {
      print(response.statusCode);
      print(response.data);
    }
  }
}
