import 'package:flutter/material.dart';

import '../day6task_screen.dart';

class ClipScreen extends StatefulWidget {
  const ClipScreen({super.key});

  @override
  _ClipScreenState createState() => _ClipScreenState();
}

class _ClipScreenState extends State<ClipScreen> {
  final List<String> allSkills = [
    'Flutter',
    'Dart',
    'React',
    'JavaScript',
    'Python',
    'Java',
    'Swift',
    'C#',
    'Ruby',
  ];

  void _onSkillSelected(String skill) {
    setState(() {
      if (skills.contains(skill)) {
        skills.remove(skill);
      } else {
        skills.add(skill);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: allSkills.map((skill) {
          return FilterChip(
            label: Text(skill),
            selected: skills.contains(skill),
            onSelected: (selected) => _onSkillSelected(skill),
            selectedColor: Colors.green,
            backgroundColor: Colors.grey[300],
            checkmarkColor: Colors.white,
          );
        }).toList(),
      ),
    );
  }
}
