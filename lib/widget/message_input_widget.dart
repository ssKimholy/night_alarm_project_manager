import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MessageInputWidget extends StatefulWidget {
  final String type;
  final String textMessage;
  final Function setTextMessage;
  final Function setSelectedFile;

  const MessageInputWidget(
      {super.key,
      required this.type,
      required this.textMessage,
      required this.setTextMessage,
      required this.setSelectedFile});

  @override
  State<MessageInputWidget> createState() => _MessageInputWidgetState();
}

class _MessageInputWidgetState extends State<MessageInputWidget> {
  final TextEditingController controller = TextEditingController();
  String? _selectedFileName;

  // 권한 요청 함수
  Future<bool> _requestPermission() async {
    // PermissionStatus status = await Permission.storage.status;

    // if (!status.isGranted) {
    //   status = await Permission.storage.request();
    // }
    if (await Permission.storage.isGranted) {
      return true;
    }

    // Android 11 이상에서는 MANAGE_EXTERNAL_STORAGE 권한이 필요
    if (await Permission.storage.request().isGranted) {
      return true;
    } else if (await Permission.manageExternalStorage.request().isGranted) {
      return true;
    }

    return false;
  }

  // 파일 선택 함수
  Future<void> _pickFile() async {
    // 권한 체크
    bool hasPermission = await _requestPermission();
    if (!hasPermission) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("파일 접근 권한이 필요합니다.")),
      );
      return;
    }

    // 파일 선택
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'mp4'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFileName = result.files.first.name;
      });

      File file = File(result.files.first.path!);
      widget.setSelectedFile(file);

      // 여기서 파일을 서버로 업로드하는 로직을 추가할 수 있습니다.
      print("Selected file: ${result.files.first.name}");
    } else {
      // 사용자가 파일 선택을 취소한 경우
      print("No file selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xfffafafa),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20.0,
              ),
              Text(
                '${widget.type.split(" ")[0]} Message',
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          widget.type == 'text'
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    onChanged: (text) {
                      widget.setTextMessage(text);
                    },
                    controller: controller,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 12.0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color:
                            const Color(0xff898585).withOpacity(0.2), // 테두리 색상
                        width: 0.5, // 테두리 두께
                      )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게 설정
                        borderSide: BorderSide(
                          color: const Color(0xff898585)
                              .withOpacity(0.2), // 테두리 색상
                          width: 0.5, // 테두리 두께
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게 설정
                        borderSide: BorderSide(
                          color: const Color(0xff898585)
                              .withOpacity(0.2), // 테두리 색상
                          width: 0.5,
                        ),
                      ),
                      hintText: 'write down the text message.',
                      hintStyle: TextStyle(
                          color: const Color(0xff898585).withOpacity(0.6),
                          fontFamily: 'Noto_Sans_KR',
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: _pickFile,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffcbcbcb),
                    ),
                    child: const Icon(
                      Icons.upload_rounded,
                      color: Color(0xff888888),
                      size: 28,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
