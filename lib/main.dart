import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studybot/subjectform.dart';
import 'login_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'home.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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

  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    String? value;
    void readingvalue() async {
      value = await storage.read(key: 'email');
    }

    readingvalue();
    if (value != null) {
      page4or1 = 'home';
    }

    super.initState();
    Subjectform(
      submit: fun2,
    );
  }

  void fun2() {
    setState(() {
      page4or1 = 'Home';
    });
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: (page4or1 == 'login')
          ? LoginPage(
              fun2: fun2,
            )
          : const Home(),
    ));
  }
}
