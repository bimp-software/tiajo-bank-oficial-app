import 'package:flutter/material.dart';
import '../../../data/models/school_model.dart';
import '../../../data/mock/mock_schools.dart';

class SchoolSearchView extends StatefulWidget {
  const SchoolSearchView({super.key});

  @override
  State<SchoolSearchView> createState() => _SchoolSearchViewState();
}

class _SchoolSearchViewState extends State<SchoolSearchView> {
  final _controller = TextEditingController();
  List<SchoolModel> _results = mockSchools;

  void _onChanged(String query) {
    setState(() {
      _results = mockSchools
          .where((s) => s.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _selectSchool(SchoolModel school) {
    Navigator.pushNamed(context, '/login', arguments: school);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Busca tu colegio')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: _onChanged,
              decoration: const InputDecoration(
                labelText: 'Nombre del colegio',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  final school = _results[index];
                  return ListTile(
                    leading: const Icon(Icons.school),
                    title: Text(school.name),
                    subtitle: Text(school.slug),
                    onTap: () => _selectSchool(school),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}