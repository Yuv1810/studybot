import 'package:flutter/material.dart';
import 'result.dart';
import 'questions.dart';
import 'form.dart';
import 'package:riverpod/riverpod.dart';

final question = StateProvider<int>((ref) => 0);
final time = StateProvider<int>((ref) => 0);

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

  // int questions = 0;
  // int time = 0;

  void changetoquestion() {
    setState(() {
      currPage = 'test';
    });
  }

  // changing it to formpage
  var currPage = 'form';

  @override
  Widget build(BuildContext context) {
    if (currPage == 'test') {
      return (TestQuestions(
        changePage: changepage,
      ));
    } else if (currPage == 'result') {
      return (const ResultPage());
    } else {
      return (QForm(
        fun: changetoquestion,
      ));
    }
  }
}
