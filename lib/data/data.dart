import 'dart:core';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadLessons() async {
  return await rootBundle.loadString('lib/data/dir/lessons.json');
}

Future<String> loadQuizzes() async {
  return await rootBundle.loadString('lib/data/dir/quizzes.json');
}

class Lesson {
  final List cards;

  Lesson({this.cards});

  Lesson.fromJson(Map<String, dynamic> json)
    : cards = json['cards'];
  
  static Lesson lessonFactory(Map<String, dynamic> json, String lessonName) {
    return Lesson.fromJson(json[lessonName]);
  }
}

class Card {
  final String text;
  final String source;

  Card({this.text, this.source});

  Card.fromJson(Map<String, dynamic> json)
    : text = json['text'],
      source = json['source'];
}

class Quiz {
  final List<Question> questions;

  Quiz({this.questions});

  Quiz.fromJson(Map<String, dynamic> json)
    : questions = (json['questions'] as List).map((q) => Question.fromJson(q));

  static Quiz quizFactory(Map<String, dynamic> json, String quizName) {
    return Quiz.fromJson(json[quizName]);
  }
}

class Question {
  final String text;
  final String type;
  final dynamic answer;

  Question({this.text, this.type, this.answer});

  Question.fromJson(Map<String, dynamic> json)
    : text = json['text'],
      type = json['type'],
      answer = json['answer'];
}