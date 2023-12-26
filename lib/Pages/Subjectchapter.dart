import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:studybot/Pages/Subjectchapter.dart';
import 'package:studybot/Pages/MyChatApp.dart';
import 'package:studybot/Pages/MyChatAppformain.dart';

class SubjectchapterPage extends StatefulWidget {
  final String subject;

  const SubjectchapterPage({Key? key, required this.subject}) : super(key: key);

  @override
  _SubjectchapterPageState createState() => _SubjectchapterPageState();
}

class _SubjectchapterPageState extends State<SubjectchapterPage> {
  TextEditingController _searchController = TextEditingController();
  final List<String> _allchapters = [
    'Introduction to Biology',
    'Cell Structure and Function',
    'Genetics',
    'Evolution',
    'Ecology',
    'Microbiology',
    'Anatomy and Physiology',
    'Botany',
    'Zoology',
    'Biochemistry',
    'Biotechnology',
    'Immunology',
    'Environmental Science',
    'Neurobiology',
    'Developmental Biology',
    'Ecological Conservation',
    'Biogeography',
    'Paleontology',
    'Human Biology',
    // Add more chapters as needed
  ];

  List<String> _displayedchapters = [];

  @override
  void initState() {
    super.initState();
    _displayedchapters = List.from(_allchapters);
  }

  void _performSearch(String query) {
    // Filter subjects based on the query
    _displayedchapters = _allchapters
        .where(
            (chapters) => chapters.toLowerCase().contains(query.toLowerCase()))
        .toList();

    // Update the UI to reflect the search results
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subject Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 183, 175, 254),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      _performSearch(_searchController.text);
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        _performSearch(value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search for Chapters',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _buildchaptersButtons(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildchaptersButtons(context) {
    if (_displayedchapters.isEmpty) {
      return const Center(
        child: Text('No subjects available.'),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: _displayedchapters
            .map(
              (chapter) => ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll<Color>(
                    Color.fromARGB(255, 183, 175, 254),
                  ),
                  fixedSize: MaterialStatePropertyAll<Size>(
                    Size(MediaQuery.of(context).size.width, 40),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyChatApp(
                        chapter: chapter,
                        subject: widget.subject,
                      ),
                    ),
                  );
                },
                child: Text(
                  chapter,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
