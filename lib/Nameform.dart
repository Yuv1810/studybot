import 'package:flutter/material.dart';
import 'package:studybot/subjectform.dart';

class Nameform extends StatefulWidget {
  final void Function() fun;
  final void Function() fun2;
  const Nameform({super.key, required this.fun, required this.fun2});

  @override
  State<StatefulWidget> createState() {
    return Nameformstate();
  }
}

class Nameformstate extends State<Nameform> {
  final textcontroller = TextEditingController();
  var name = '';
  bool student = true;

  @override
  void dispose() {
    textcontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Subjectform(
      submit: widget.fun2,
    );
    super.initState();
  }

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.all(22)),
        //row1
        const Row(
          children: [
            Padding(padding: EdgeInsets.all(18)),
            Text(
              'Name',
              style: TextStyle(fontSize: 27),
            ),
            Text(
              '*',
              style: TextStyle(
                  fontSize: 27, color: Color.fromARGB(255, 163, 5, 5)),
            ),
          ],
        ),

        const Padding(padding: EdgeInsets.all(10)),

        Row(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              height: 60,
              width: 340,
              child: TextFormField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 12, 13, 14),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1.0))),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                key: _key,
                controller: textcontroller,
              ),
            ),
          ],
        ),

//
//
//
//
//
//
//
//
        //row2

        const Padding(padding: EdgeInsets.all(18)),

        const Row(
          children: [
            Padding(padding: EdgeInsets.all(18)),
            Text(
              'School Student?',
              style: TextStyle(fontSize: 27),
            ),
            Text(
              '*',
              style: TextStyle(
                  fontSize: 27, color: Color.fromARGB(255, 163, 5, 5)),
            ),
          ],
        ),

        const Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(18)),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.fromLTRB(7, 6, 7, 6),
                ),
                backgroundColor: (student == true)
                    ? MaterialStateProperty.all(
                        const Color.fromARGB(255, 183, 175, 254))
                    : MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 255, 255)),
                elevation: MaterialStateProperty.all<double>(.10),
                fixedSize: MaterialStateProperty.all(
                  const Size(80, 40),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.black, width: 1.8)),
              ),
              onPressed: () {
                // Handle 'Yes' button press
                setState(() {
                  student = true;
                });
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),

            ///
            ///
            ///
            ///
            const SizedBox(width: 16), // Add some space between buttons
////
////
            ///
            ///
            ///
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.fromLTRB(7, 6, 7, 6),
                ),
                backgroundColor: (student == false)
                    ? MaterialStateProperty.all(
                        const Color.fromARGB(255, 183, 175, 254))
                    : MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 255, 255)),
                elevation: MaterialStateProperty.all<double>(.10),
                fixedSize: MaterialStateProperty.all(
                  const Size(80, 40),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.black, width: 1.8)),
              ),
              onPressed: () {
                // Handle 'No' button press
                setState(() {
                  student = false;
                });
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),

        //
        const SizedBox(
          height: 270,
        ),
        //
        //row 3
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
                side: MaterialStateProperty.all(const BorderSide(width: .3)),
              ),
              onPressed: (name == '') ? null : () => {widget.fun()},
              child: const Text(
                'Continue',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 10, 50, 0)),
          ],
        ),
      ],
    );
  }
}
