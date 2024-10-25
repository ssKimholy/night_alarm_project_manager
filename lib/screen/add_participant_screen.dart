import 'package:flutter/material.dart';

class AddParticipantScreen extends StatefulWidget {
  String pName;
  String pId;
  String pType;

  AddParticipantScreen(
      {super.key, this.pName = '', this.pId = '', this.pType = ''});

  @override
  State<AddParticipantScreen> createState() => _AddParticipantScreenState();
}

class _AddParticipantScreenState extends State<AddParticipantScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40.0,
              ),
              const Text('참여자 이름',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (text) {
                  setState(() {
                    widget.pName = text;
                  });
                },
                controller: _nameController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 12.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: const Color(0xff898585).withOpacity(0.2), // 테두리 색상
                    width: 0.5, // 테두리 두께
                  )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게 설정
                    borderSide: BorderSide(
                      color: const Color(0xff898585).withOpacity(0.2), // 테두리 색상
                      width: 0.5, // 테두리 두께
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게 설정
                    borderSide: BorderSide(
                      color: const Color(0xff898585).withOpacity(0.2), // 테두리 색상
                      width: 0.5,
                    ),
                  ),
                  hintText: 'write down the name of participant.',
                  hintStyle: TextStyle(
                      color: const Color(0xff898585).withOpacity(0.6),
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text('참여자 아이디',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (text) {
                  setState(() {
                    widget.pId = text;
                  });
                },
                controller: _idController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 12.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: const Color(0xff898585).withOpacity(0.2), // 테두리 색상
                    width: 0.5, // 테두리 두께
                  )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게 설정
                    borderSide: BorderSide(
                      color: const Color(0xff898585).withOpacity(0.2), // 테두리 색상
                      width: 0.5, // 테두리 두께
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게 설정
                    borderSide: BorderSide(
                      color: const Color(0xff898585).withOpacity(0.2), // 테두리 색상
                      width: 0.5,
                    ),
                  ),
                  hintText: 'write down id of participant.',
                  hintStyle: TextStyle(
                      color: const Color(0xff898585).withOpacity(0.6),
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text('참여자 타입',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Noto_Sans_KR',
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 20.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.pType = 'Text Group';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.pType == 'Text Group'
                          ? const Color(0xff3AD277).withOpacity(0.5)
                          : const Color(0xff898585).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: const Text(
                      'Text Group',
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
                    setState(() {
                      widget.pType = 'Voice Group';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.pType == 'Voice Group'
                          ? const Color(0xff3AD277).withOpacity(0.5)
                          : const Color(0xff898585).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: const Text(
                      'Voice Group',
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
                    setState(() {
                      widget.pType = 'Video Group';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.pType == 'Video Group'
                          ? const Color(0xff3AD277).withOpacity(0.5)
                          : const Color(0xff898585).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: const Text(
                      'Video Group',
                      style: TextStyle(
                          fontFamily: 'Noto_Sans_KR',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: GestureDetector(
                    onTap: () {
                      // http add participant
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80.0, vertical: 12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xff3ad277),
                      ),
                      child: const Text('참여자 추가',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Noto_Sans_KR',
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
