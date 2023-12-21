import 'package:flutter/material.dart';
import 'package:studybot/page1.dart';
import 'home.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var page4or1 = 'login';
  void fun2() {
    setState(() {
      page4or1 = 'Home';
    });
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: (page4or1 == 'log')
          ? Page1(
              fun2: fun2,
            )
          : const Home(),
    )
        // home: LoginPage(),
        // home: Page1(
        //   fun2: fun2,
        // ),
        );
  }
}
