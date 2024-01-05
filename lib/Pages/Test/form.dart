import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studybot/Pages/Test/toggle.dart';

class QForm extends ConsumerWidget {
  void Function() fun;

  QForm({
    super.key,
    required this.fun,
  });
  var text1 = '';
  var text2 = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final formkey = GlobalKey<FormState>();
    // TextEditingController myController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Fields Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            decoration: BoxDecoration(
              color:
                  const Color.fromARGB(255, 255, 255, 255), // Background color
              border: Border.all(
                color: Colors.black, // Border color
                width: 2.0, // Border width
              ),
              borderRadius: BorderRadius.circular(12.0), // Border radius
            ),
            child: Form(
              key: _formKey, // Use one FormKey for the entire form
              child: Column(
                children: [
                  const Row(
                    children: [
                      Padding(padding: EdgeInsets.all(2)),
                      Text(
                        'Number of Questions',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                            fontSize: 27,
                            color: Color.fromARGB(255, 163, 5, 5)),
                      ),
                    ],
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'No of Question Eg: 20'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter No of Questions ';
                      }
                      if (value.length > 2 ||
                          int.tryParse(value) == null ||
                          int.tryParse(value)! > 50) {
                        return 'Please enter a valid 2-digit number less than 50 .';
                      }
                      text1 = value;
                      return null;
                    },
                  ),
                  const SizedBox(height: 40.0),
                  const Row(
                    children: [
                      Padding(padding: EdgeInsets.all(2)),
                      Text(
                        'Time',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                            fontSize: 27,
                            color: Color.fromARGB(255, 163, 5, 5)),
                      ),
                    ],
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Time in minutes Eg: 30',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Time limit';
                      }
                      if (value.length != 2 ||
                          int.tryParse(value) == null ||
                          int.tryParse(value)! > 180) {
                        print(int.tryParse(value).runtimeType);
                        return 'Please enter a valid 2-digit number less than 180 .';
                      }
                      text2 = value;
                      return null;
                    },
                  ),
                  SizedBox(height: 40.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.fromLTRB(7, 6, 7, 6),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(254, 108, 100, 254)),
                      elevation: MaterialStateProperty.all<double>(1.7),
                      fixedSize: MaterialStateProperty.all(
                        const Size(150, 40),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      side: MaterialStateProperty.all(
                          const BorderSide(width: .3)),
                    ),
                    onPressed: () {
                      // Validate the form
                      if (_formKey.currentState?.validate() ?? false) {
                        var questionno = ref.watch(question.notifier).state =
                            int.tryParse(text1)!;
                        var timein = ref.watch(time.notifier).state =
                            int.tryParse(text2)!;
                        print('-------------');
                        print(questionno);
                        print(timein);
                        print('-------------');
                        fun();
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
