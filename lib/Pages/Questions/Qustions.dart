import 'package:flutter/material.dart';
import 'data.dart';

class QuestionsAnswers extends StatefulWidget {
  const QuestionsAnswers({super.key});

  @override
  State<QuestionsAnswers> createState() => _QuestionsAnswersState();
}

class _QuestionsAnswersState extends State<QuestionsAnswers> {
  var q = [];
  var a = [];
  @override
  void initState() {
    for (int i = 0; i < oldsQuestions.length; i++) {
      q.add(oldsQuestions[i]['question']);
      a.add(oldsQuestions[i]['options'][0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions'),
        surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 3, 20, 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: q.map((e) {
            return Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 183, 175, 254)),
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Q.${q.indexOf(e) + 1}  ${e}',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Ans.  ${a[q.indexOf(e)]}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(
                              Color.fromARGB(254, 108, 100, 255),
                            ),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    15.0), // Adjust the radius here
                              ),
                            ),
                          ),
                          onPressed: () {
                            print(e);
                            //navigator.push context in
                            //for that question and with explain
                            // to main chat app
                          },
                          child: const Text(
                            "Explain",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ))
                    ],
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
