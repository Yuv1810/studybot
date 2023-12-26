import 'package:flutter/material.dart';

class MyChatAppformain extends StatefulWidget {
  const MyChatAppformain({super.key});

  @override
  State<StatefulWidget> createState() {
    return ChatState();
  }
}

class ChatState extends State<MyChatAppformain> {
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
                const Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      children: [
                        Text(
                          " textContent",
                          style: TextStyle(fontSize: 20),
                        ),

                        // input list to display
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(13, 10, 13, 20),
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          child: TextField(
                            scrollPadding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                            scrollPhysics: const BouncingScrollPhysics(),
                            style: const TextStyle(fontSize: 20),
                            cursorHeight: 24,
                            minLines: 1,
                            maxLines: 5,
                            key: _key,
                            controller: textcontroller,
                            onChanged: (value) {
                              input = value;
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
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
