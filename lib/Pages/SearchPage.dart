import 'package:flutter/material.dart';

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
                border: Border.all(color: Colors.grey),
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
              child: _buildSubjectButtons(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectButtons() {
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SubjectDetailsPage(subject: subject),
                    ),
                  );
                },
                child: Text(subject),
              ),
            )
            .toList(),
      ),
    );
  }
}

class SubjectDetailsPage extends StatelessWidget {
  final String subject;

  const SubjectDetailsPage({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subject Details'),
      ),
      body: Center(
        child: Text('Details for $subject'),
      ),
    );
  }
}
