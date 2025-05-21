import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  String? _gender;

  final Color OliveGreen = Color(0xFF4F6F52);

  @override
  Widget build(BuildContext context) {
    final inputWidth = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Image.asset(
                    'assets/logo2.png',
                    width: 200,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '환영합니다.',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                ),
                Container(
                  width: inputWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '대상자 이름을 입력해주세요.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Center(
                        child: Container(
                          width: 200,
                          child: TextField(
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: inputWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '대상자 나이를 입력해주세요.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Center(
                        child: Container(
                          width: 200,
                          child: TextField(
                            controller: _ageController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: inputWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '대상자 성별을 입력해주세요.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Center(
                        child: Container(
                          width: 200,
                          child: DropdownButtonFormField<String>(
                            value: _gender,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            dropdownColor: Colors.white,
                            style: TextStyle(color: Colors.black),
                            iconEnabledColor: OliveGreen,
                            items: ['남자', '여자'].map((gender) {
                              return DropdownMenuItem<String>(
                                value: gender,
                                child: Text(gender),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _gender = value;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: OliveGreen,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    final name = _nameController.text.trim();
                    final age = _ageController.text.trim();
                    final gender = _gender ?? '선택 안됨';

                    print('이름: $name, 나이: $age, 성별: $gender');

                    Navigator.pushNamed(context, '/home');
                  },
                  child: Text('로그인'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }
}
