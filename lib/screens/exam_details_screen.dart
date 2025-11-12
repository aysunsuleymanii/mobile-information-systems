import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailsScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailsScreen({
    Key? key,
    required this.exam,
  }) : super(key: key);

  String _getTimeRemaining() {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);

    if (difference.isNegative) {
      return 'Exam is finished';
    }

    final days = difference.inDays;
    final hours = difference.inHours % 24;

    return '$days days, $hours hours';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subject),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exam details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    const Divider(height: 30),
                    _buildDetailRow(
                      Icons.book,
                      'Course',
                      exam.subject,
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      Icons.calendar_today,
                      'Date',
                      '${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}',
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      Icons.access_time,
                      'Time',
                      '${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}',
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      Icons.room,
                      'Exam Rooms:',
                      exam.rooms.join(', '),
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      Icons.timer,
                      'Remaining: ',
                      _getTimeRemaining(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blue, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}