import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final String indexNumber;

  const HomeScreen({
    Key? key,
    required this.indexNumber,
  }) : super(key: key);

  List<Exam> _getExams() {
    final now = DateTime.now();
    return [
      Exam(
        subject: 'Mobile Information Systems',
        dateTime: DateTime(now.year, now.month, now.day + 2, 10, 0),
        rooms: ['AMF 1', 'AMF 2'],
      ),
      Exam(
        subject: 'Web Programming',
        dateTime: DateTime(now.year, now.month, now.day + 5, 12, 0),
        rooms: ['Lab 1'],
      ),
      Exam(
        subject: 'Databases',
        dateTime: DateTime(now.year, now.month, now.day + 7, 9, 0),
        rooms: ['AMF 3'],
      ),
      Exam(
        subject: 'Operating Systems',
        dateTime: DateTime(now.year, now.month, now.day + 10, 11, 0),
        rooms: ['Lab 2', 'Lab 3'],
      ),
      Exam(
        subject: 'Computer Networks and Security',
        dateTime: DateTime(now.year, now.month, now.day + 12, 14, 0),
        rooms: ['Lab 13'],
      ),
      Exam(
        subject: 'Artificial Intelligence',
        dateTime: DateTime(now.year, now.month, now.day + 15, 10, 30),
        rooms: ['Lab 215'],
      ),
      Exam(
        subject: 'Algorithms and Data Structures',
        dateTime: DateTime(now.year, now.month, now.day + 20, 9, 30),
        rooms: ['Lab 2', 'Lab 3', 'Lab 215'],
      ),
      Exam(
        subject: 'Object Oriented Programming',
        dateTime: DateTime(now.year, now.month, now.day - 3, 11, 0),
        rooms: ['Lab 215'],
      ),
      Exam(
        subject: 'Calculus',
        dateTime: DateTime(now.year, now.month, now.day - 7, 15, 0),
        rooms: ['AMF 1', 'AMF 2'],
      ),
      Exam(
        subject: 'Probability and Statistics',
        dateTime: DateTime(now.year, now.month, now.day + 25, 8, 0),
        rooms: ['AMF 1'],
      ),
    ]..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    final exams = _getExams();

    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Schedule - $indexNumber'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          return ExamCard(
            exam: exams[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExamDetailsScreen(exam: exams[index]),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              'Total exams : ${exams.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}