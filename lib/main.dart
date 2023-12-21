import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      // home: (page4or1 == 'log')
      //     ? Page1(
      //         fun2: fun2,
      //       )
      //     : const Home(),
      // )
      home: LoginPage(
        fun2: fun2,
      ),
      // home: Page1(
      //   fun2: fun2,
    ));
  }
}
