import 'package:flutter/material.dart';
import 'result.dart';
import 'questions.dart';

class TogglePage extends StatefulWidget {
  const TogglePage({super.key});

  @override
  State<TogglePage> createState() => _TogglePageState();
}

class _TogglePageState extends State<TogglePage> {
  void changepage() {
    setState(() {
      currPage = 'result';
    });
  }

  var currPage = 'test';

  @override
  Widget build(BuildContext context) {
    if (currPage == 'test') {
      return (TestQuestions(
        changePage: changepage,
      ));
    } else {
      return (const ResultPage());
    }
  }
}
