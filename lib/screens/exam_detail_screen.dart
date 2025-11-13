import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String getTimeRemaining() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);

    if (diff.isNegative) {
      return "Испитот веќе помина.";
    }

    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    final date = "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}";
    final time = "${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}";

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exam.subjectName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Датум: $date",
                      softWrap: true,
                    ),
                  ),
                ]),
                Row(children: [
                  const Icon(Icons.access_time),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Време: $time",
                      softWrap: true,
                    ),
                  ),
                ]),
                Row(children: [
                  const Icon(Icons.meeting_room),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Простории: ${exam.rooms.join(', ')}",
                      softWrap: true,
                    ),
                  ),
                ]),
                const SizedBox(height: 20),
                Row(children: [
                  const Icon(Icons.hourglass_bottom),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Преостанато време: ${getTimeRemaining()}",
                      softWrap: true,
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}