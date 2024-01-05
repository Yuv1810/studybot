import 'package:flutter/material.dart';
import 'Qustions.dart';

class Chapterselection extends StatefulWidget {
  final String subject;
  const Chapterselection({Key? key, required this.subject}) : super(key: key);

  @override
  State<Chapterselection> createState() => _ChapterselectionState();
}

class _ChapterselectionState extends State<Chapterselection> {
  late List<String> Chapterslist;
  int size = 0;
  List<bool> checklist = [];

  @override
  void initState() {
    super.initState();
    Chapterslist = [
      'All chapters',
      'Introduction to Biology',
      'Cell Biology',
      'Genetics',
      'Evolution',
      'Ecology',
      'Botany',
      'Zoology',
      'Human Biology',
      'Microbiology',
      'Environmental Biology',
      'Biotechnology',
      'Biochemistry',
      'Neurobiology',
      'Molecular Biology',
      'Immunology',
      'Developmental Biology',
    ];
    size = Chapterslist.length;
    checklist = List.generate(size, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final buttonWidth = (MediaQuery.of(context)
        .size
        .width); // Adjust the multiplier for the desired size

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text('Chapters - ${widget.subject}'),
      ),
      body: ListView.builder(
        itemCount: size,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: 20),
              CheckboxListTile(
                checkColor: const Color.fromARGB(255, 0, 0, 0),
                // fillColor: const MaterialStatePropertyAll(
                //   Color.fromARGB(254, 108, 100, 254),
                // ),
                activeColor: const Color.fromARGB(255, 183, 175, 254),
                title: Text(Chapterslist[index]),
                value: checklist[index],
                onChanged: (val) {
                  setState(() {
                    if (index == 0) {
                      checklist[index] = !checklist[index];
                      for (int i = 1; i < Chapterslist.length; i++) {
                        checklist[i] = checklist[index];
                      }
                    } else {
                      checklist[index] = val!;
                    }
                  });
                },
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.fromLTRB(90, 15, 90, 15),
        color: const Color.fromARGB(255, 255, 255, 255),
        surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
        child: SizedBox(
          width: buttonWidth,
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
              printSelectedChapters();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => const QuestionsAnswers()));
            },
            child: const Text(
              'Submit',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 0, 0),
                  letterSpacing: 1),
            ),
          ),
        ),
      ),
    );
  }

  void printSelectedChapters() {
    print('Selected Chapters:');
    for (int i = 0; i < size; i++) {
      if (checklist[i]) {
        print('- ${Chapterslist[i]}');
      }
    }
  }
}
