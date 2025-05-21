import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '라우트 예제',
      initialRoute: '/login', // 앱 시작 시 표시할 경로
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => Home(),
      },
    );
  }
}
