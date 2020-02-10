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


  static Lesson _lessonFactory(String json, String lessonName) {
    return Lesson.fromJson(jsonDecode(json)[lessonName]);
  }

  static Future<Lesson> localLessonFactory(String lessonName) {
    return loadLessons().then((json) => _lessonFactory(json, lessonName));
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

  static Quiz _quizFactory(String json, String quizName) {
    return Quiz.fromJson(jsonDecode(json)[quizName]);
  }

  static Future<Quiz> localQuizFactory(String quizName) {
    return loadQuizzes().then((json) => _quizFactory(json, quizName));
  }
}

class Question {
  final String text;
  final String type;
  final dynamic answer;

  Question({this.text, this.type, this.answer});
  //TODO: remove plain constructor, as it is simply for testing
  /*Question.plain(String text, String type, String answer) {
    this.text = text;
    this.type = type;
    this.answer = answer;
  }*/

  Question.fromJson(Map<String, dynamic> json)
    : text = json['text'],
      type = json['type'],
      answer = json['answer'];
}