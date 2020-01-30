import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadLessons() {
  return rootBundle.loadString('lib/data/dir/lessons.json');
}

Future<String> loadQuizzes() {
  return rootBundle.loadString('lib/data/dir/quizzes.json');
}

class Lesson {
  final List<Card> cards;

  Lesson({this.cards});

  Lesson.fromJson(Map<String, dynamic> json)
    : cards = (json['cards'] as List).map((l) => Card.fromJson(l));

  // future which will return
  static Future<Lesson> lessonFactory(String lessonName) {
    return loadLessons().then((json) => Lesson.fromJson(jsonDecode(json)[lessonName]));
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

  static Future<Quiz> quizFactory(String quizName) {
    return loadQuizzes().then((json) => Quiz.fromJson(jsonDecode(json)[quizName]));
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