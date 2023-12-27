import 'package:flutter/material.dart';

class MyChatApp extends StatefulWidget {
  final String chapter;
  final String subject;
  const MyChatApp({super.key, required this.chapter, required this.subject});

  @override
  State<StatefulWidget> createState() {
    return ChatState();
  }
}

class ChatState extends State<MyChatApp> {
  var textcontroller = TextEditingController();
  String input = '';

  @override
  void initState() {
    print(widget.chapter);
    super.initState();
  }

  final _key = GlobalKey<FormState>();
  List<String> user = [];
  List<String> bot = [];

  List<String> topics = [
    "Frame of reference",
    "Motion in a straight line",
    "Position-time graph and speed",
    "Elementary concepts of differentiation and integration for describing motion",
    "Scalar and vector quantities",
    "Uniform and non-uniform motion",
    "Relative velocity",
    "Frame of reference",
    "Motion in a straight line",
    "Position-time graph and speed",
    "Elementary concepts of differentiation and integration for describing motion",
    "Scalar and vector quantities",
    "Uniform and non-uniform motion",
    "Relative velocity",
    "Relative velocity",
  ];

  void fun(value) {
    setState(() {
      input = value;
    });
  }

  String textContent =
      "To be, or not to be: that is the question: whether 'tis nobler in the mind to suffer the slings and arrows of outrageous fortune, or to take arms against a sea of troubles, and by opposing end them? To die: to sleep; no more.";

  @override
  Widget build(BuildContext context) {
    var x = topics.map((data) {
      return (Center(
        child: ListTile(
          contentPadding: const EdgeInsets.fromLTRB(25, 4, 10, 4),
          tileColor: const Color.fromARGB(255, 255, 255, 255),
          title: Text(
            data,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ));
    }).toList();
    return (GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          ),
          drawer: Drawer(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: SingleChildScrollView(
              child: Center(
                child: Column(children: [
                  const SizedBox(
                    height: 60,
                  ),
                  ...x
                ]),
              ),
            ),
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
                            " toContent",
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
          )),
    ));
  }
}
