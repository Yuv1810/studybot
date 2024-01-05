import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studybot/Pages/Test/toggle.dart';
import 'data.dart';
import 'dart:async';

class TestQuestions extends ConsumerStatefulWidget {
  final void Function() changePage;
  const TestQuestions({super.key, required this.changePage});

  @override
  ConsumerState<TestQuestions> createState() => _TestQuestionsState();
}

class _TestQuestionsState extends ConsumerState<TestQuestions> {
  List<int> answers = [];
  late List<Map<String, dynamic>> Questions = [];
  var size = 0;
  List<List<bool>> values = [];
  var x;
  late Timer _timer;
  int _minutes = 1;

  int _seconds = 0;

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  void initState() {
    var zx = ref.read(time.notifier).state;
    _minutes = zx;
    for (int i = 0; i < oldsQuestions.length; i++) {
      List<String> p = [];
      for (int k = 0; k < 4; k++) {
        p.add(oldsQuestions[i]['options'][k]);
      }
      Map<String, dynamic> v = {
        'topics': oldsQuestions[i]['topics'],
        'question': oldsQuestions[i]['question'],
        'options': p
      };
      Questions.add(v);
      print(oldsQuestions[i]);
      print(Questions[i]);
    }
    // _minutes = ref.watch(time.notifier).state;

    size = Questions.length;
    // print(newQuestions[0]['options']);
    for (int i = 0; i < size; i++) {
      Questions[i]['options'].shuffle();
      // print(newQuestions[0]['options']);
    }
    // print(newQuestions[0]['options']);
    for (int i = 0; i < Questions.length; i++) {
      answers.add(-1);
      List<bool> p = [false, false, false, false];

      values.add(p);
    }

    x = Questions.map((q) {
      return (Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          Text(
            '${Questions.indexOf(q) + 1} .  ' + q['question'],
            textAlign: TextAlign.center,
            softWrap: true,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          CheckboxListTile(
            value: values[Questions.indexOf(q)][0],
            onChanged: (val) => click(val, Questions.indexOf(q), 0),
            title: Text(q['options'][0]),
          ),
          CheckboxListTile(
            value: values[Questions.indexOf(q)][1],
            onChanged: (val) => click(val, Questions.indexOf(q), 1),
            title: Text(q['options'][1]),
          ),
          CheckboxListTile(
            value: values[Questions.indexOf(q)][2],
            onChanged: (val) => click(val, Questions.indexOf(q), 2),
            title: Text(q['options'][2]),
          ),
          CheckboxListTile(
            value: values[Questions.indexOf(q)][3],
            onChanged: (val) => click(val, Questions.indexOf(q), 3),
            title: Text(q['options'][3]),
          )
        ],
      )

          // Text(q['options'][0])

          );
    });

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_minutes == 0 && _seconds == 0) {
          _timer.cancel(); // Stop the timer when it reaches 0
          // Optionally, you can perform an action when the timer reaches 0
          print('Time is up!');
          print(answers);
          widget.changePage(); // Move to the next page or perform any action
        } else if (_seconds == 0) {
          _minutes--;
          _seconds = 59;
        } else {
          _seconds--;
        }
      });
    });

    super.initState();
  }

  void click(val, j, index) {
    setState(() {
      if (!values[j][index]) {
        for (int i = 0; i < 4; i++) {
          values[j][i] = false;
        }
        values[j][index] = true;
      } else {
        values[j][index] = false;
      }
      for (int i = 0; i < 4; i++) {
        if (values[j][i] == true) {
          answers[j] = i;
          break;
        }
      }
    });
  }

  // print('___________');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Test'),
              Text('$_minutes:${_seconds.toString().padLeft(2, '0')}'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [...x],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.fromLTRB(90, 15, 90, 15),
          surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll<Color>(
                  Color.fromARGB(255, 183, 175, 254),
                ),
                shape: MaterialStatePropertyAll<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15.0), // Adjust the radius here
                  ),
                ),
              ),
              onPressed: () {
                print(answers);
                // print(Questions);
                int correctanswers = 0;
                int wronganwers = 0;
                int unanswered = 0;

//imfofufhd
//to do the check and add topics to it

                for (int i = 0; i < size; i++) {
                  print('-----------------------');
                  print(oldsQuestions[i]['options'][0]);
                  print(answers[i]);
                  print(Questions[i]['options'][0]);
                  print('-----------------------');

                  if (answers[i] != -1 &&
                      oldsQuestions[i]['options'][0] ==
                          Questions[i]['options'][answers[i]]) {
                    correctanswers++;
                  } else if (answers[i] == -1) {
                    unanswered++;
                  } else {
                    wronganwers++;
                  }
                }
                print(wronganwers);
                print(correctanswers);
                print(unanswered);
                widget.changePage();
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                    color: Color.fromARGB(255, 14, 1, 1), fontSize: 20),
              )),
        ));
  }
}
