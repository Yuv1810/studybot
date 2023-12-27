import 'package:flutter/material.dart';
import 'data.dart';

class TestQuestions extends StatefulWidget {
  final void Function() changePage;
  const TestQuestions({super.key, required this.changePage});

  @override
  State<TestQuestions> createState() => _TestQuestionsState();
}

class _TestQuestionsState extends State<TestQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [],
      ),
    );
  }
}
