import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({
    Key? key,
    required this.exam,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      color: exam.isPassed ? Colors.grey[300] : Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.subject,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: exam.isPassed ? Colors.grey[600] : Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 18,
                    color: exam.isPassed ? Colors.grey : Colors.blue,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}',
                    style: TextStyle(
                      fontSize: 16,
                      color: exam.isPassed ? Colors.grey[600] : Colors.black54,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Icon(
                    Icons.access_time,
                    size: 18,
                    color: exam.isPassed ? Colors.grey : Colors.green,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      fontSize: 16,
                      color: exam.isPassed ? Colors.grey[600] : Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.room,
                    size: 18,
                    color: exam.isPassed ? Colors.grey : Colors.red,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      exam.rooms.join(', '),
                      style: TextStyle(
                        fontSize: 16,
                        color: exam.isPassed ? Colors.grey[600] : Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}