import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'home.dart';

class Subjectform extends StatefulWidget {
  final void Function() submit;
  Subjectform({super.key, required this.submit});

  final storage = new FlutterSecureStorage();

  String? value;
  void read() async {
    value = await storage.read(key: "mail");
    print("mail is here");
    print("mail is here");
    print("mail is here");
    print("mail is here");
    print("mail is here");
    print(value);
  }

  @override
  State<StatefulWidget> createState() {
    return Subjectformstate();
  }
}

class Subjectformstate extends State<Subjectform> {
  String? valuse;

  void fun(String? val) {
    setState(() {
      valuse = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.all(22)),
        const Row(children: [
          Padding(padding: EdgeInsets.all(18)),
          Text(
            'Targeting for:',
            style: TextStyle(fontSize: 27),
          ),
        ]),
        const Padding(padding: EdgeInsets.all(4)),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 3.0,
                color: const Color.fromARGB(132, 46, 48, 49),
              ),
            ),
            child: DropdownButton(
              iconSize: 45,
              icon: const Icon(Icons.keyboard_arrow_down),
              underline: const SizedBox(),
              isExpanded: true,
              value: valuse,
              items: const [
                DropdownMenuItem(
                  value: 'Jee',
                  child: Text(
                    'Jee',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'Neet',
                  child: Text(
                    'Neet',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'Upsc',
                  child: Text(
                    'Upsc',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: '12',
                  child: Text(
                    '12',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: '11',
                  child: Text(
                    '11',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: '10',
                  child: Text(
                    '10',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: '9',
                  child: Text(
                    '9',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
              onChanged: fun,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 383,
        ),

        //Continue button

        Stack(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ElevatedButton(
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
                    side:
                        MaterialStateProperty.all(const BorderSide(width: .3)),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => const Home()));
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(0, 10, 50, 0)),
            ],
          ),
        ]),
      ],
    ));
  }
}
