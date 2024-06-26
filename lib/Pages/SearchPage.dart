import 'package:flutter/material.dart';
import 'package:studybot/Pages/Subjectchapter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  final List<String> _allSubjects = [
    'Mathematics',
    'Physics',
    'Chemistry',
    'Biology',
    'Computer Science',
    'History',
    'Geography',
    'Literature',
    'Art',
    // Add more subjects as needed
  ];
  List<String> _displayedSubjects = [];

  @override
  void initState() {
    super.initState();
    _displayedSubjects = List.from(_allSubjects);
  }

  void _performSearch(String query) {
    // Filter subjects based on the query
    _displayedSubjects = _allSubjects
        .where((subject) => subject.toLowerCase().contains(query.toLowerCase()))
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
                        hintText: 'Search for subjects',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _buildSubjectButtons(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectButtons(context) {
    if (_displayedSubjects.isEmpty) {
      return const Center(
        child: Text('No subjects available.'),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: _displayedSubjects
            .map(
              (subject) => ElevatedButton(
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
                      builder: (context) =>
                          SubjectchapterPage(subject: subject),
                    ),
                  );
                },
                child: Text(
                  subject,
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

// class SubjectDetailsPage extends StatelessWidget {
//   final String subject;

//   const SubjectDetailsPage({Key? key, required this.subject}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Subject Details'),
//       ),
//       body: Center(
//         child: Text('Details for $subject'),
//       ),
//     );
//   }
// }
