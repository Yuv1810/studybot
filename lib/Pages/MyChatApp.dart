import 'package:flutter/material.dart';

class MyChatApp extends StatefulWidget {
  const MyChatApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return ChatState();
  }
}

class ChatState extends State<MyChatApp> {
  var textcontroller = TextEditingController();
  String input = '';

  final _key = GlobalKey<FormState>();
  List<String> user = [];
  List<String> bot = [];

  void fun(value) {
    setState(() {
      input = value;
    });
  }

  String textContent =
      "To be, or not to be: that is the question: whether 'tis nobler in the mind to suffer the slings and arrows of outrageous fortune, or to take arms against a sea of troubles, and by opposing end them? To die: to sleep; no more.";

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/Engine3.png',
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      children: [
                        Text(
                          " textContent",
                          style: const TextStyle(fontSize: 20),
                        ),

                        // input list to display
                      ],
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: 60,
                          child: TextFormField(
                            scrollPhysics: const BouncingScrollPhysics(),
                            style: const TextStyle(fontSize: 20),
                            expands: true,
                            cursorHeight: 24,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            key: _key,
                            controller: textcontroller,
                            onChanged: (value) {
                              input = value;
                            },
                          ),
                        )),
                        IconButton(
                          onPressed: () {
                            fun(textcontroller.text);
                            textcontroller.clear();
                          },
                          icon: const Icon(
                            Icons.send,
                            size: 35,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        )));
  }
}
