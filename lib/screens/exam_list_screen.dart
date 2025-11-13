import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  // DateTime ex. Компјутерски мрежи и безбедност 23 Nov 2025, 11:00

  List<Exam> get exams {
    final items = [
      Exam(
        subjectName: "Веројатност и статистика",
        dateTime: DateTime(2026, 1, 23, 09, 30),
        rooms: ["Лаб 138", "Лаб 117"],
      ),
      Exam(
        subjectName: "Програмирање на клиентска страна",
        dateTime: DateTime(2025, 11, 17, 14, 00),
        rooms: ["Лаб 215аб"],
      ),
      Exam(
        subjectName: "Компјутерски мрежи и безбедност",
        dateTime: DateTime(2025, 11, 23, 11, 00),
        rooms: ["Лаб 200в"],
      ),
      Exam(
        subjectName: "Бази на податоци",
        dateTime: DateTime(2025, 11, 12, 10, 00),
        rooms: ["Лаб 2", "Лаб 3", "Лаб 12", "Лаб 13"],
        isPassed: true,
      ),
      Exam(
        subjectName: "Оперативни системи",
        dateTime: DateTime(2025, 11, 19, 16, 30),
        rooms: ["Лаб 200аб", "Лаб 215"],
      ),
      Exam(
        subjectName: "Информациска безбедност",
        dateTime: DateTime(2025, 11, 21, 08, 00),
        rooms: ["Лаб 117"],
      ),
      Exam(
        subjectName: "Вештачка интелигенција",
        dateTime: DateTime(2025, 11, 25, 13, 15),
        rooms: ["Лаб 2"],
      ),
      Exam(
        subjectName: "Алгоритми и структури на податоци",
        dateTime: DateTime(2025, 11, 8, 09, 00),
        rooms: ["Лаб 3"],
        isPassed: true,
      ),
      Exam(
        subjectName: "Интернет технологии",
        dateTime: DateTime(2025, 11, 27, 12, 00),
        rooms: ["Лаб 13"],
      ),
      Exam(
        subjectName: "Веб програмирање",
        dateTime: DateTime(2025, 12, 01, 10, 00),
        rooms: ["Лаб 138"],
      ),
    ];

    items.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return items;
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Распоред за испити - 193040",
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (ctx, i) {
                return ExamCard(
                  exam: exams[i],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exams[i])),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            color: Colors.blueAccent,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Text(
              "Вкупно испити: ${exams.length}",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}