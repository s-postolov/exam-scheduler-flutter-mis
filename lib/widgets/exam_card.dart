import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({super.key, required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final date = "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}";
    final time = "${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}";

    return Card(
      color: exam.isPassed ? Colors.red.shade200 : Colors.blue.shade50,
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        //leading: Icon(Icons.school, color: exam.isPassed ? Colors.red : Colors.blueAccent),
        title: Text(exam.subjectName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(Icons.calendar_today, size: 16),
              const SizedBox(width: 5),
              Text(date),
            ]),
            Row(children: [
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 5),
              Text(time),
            ]),
            Row(children: [
              const Icon(Icons.meeting_room, size: 16),
              const SizedBox(width: 5),
              Expanded(child: Text(exam.rooms.join(", "))),
            ]),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}