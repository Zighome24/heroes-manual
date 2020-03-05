import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadLessonString() {
  return rootBundle.loadString('lib/data/dir/lessons.json');
}

Future<String> loadQuizzesString() {
  return rootBundle.loadString('lib/data/dir/quizzes.json');
}

// ---------------------------------------------
// TRAINING
// ---------------------------------------------

class Lesson {
  final List<Card> cards;
  final String summary;
  final String title;
  final String sources;

  Lesson({this.cards, this.summary, this.title, this.sources});

  Lesson.fromJson(Map<String, dynamic> json)
    : cards = ((json['cards']) as List).map((l) => Card.fromJson(l)).toList(),
      summary = (json['summary'] as String),
      title = (json['title'] as String),
      sources = (json['sources'] as String);

  static List<Lesson> loadLessons(String json) {
    return ((jsonDecode(json))["trainings"] as List<dynamic>)
        .map((obj) => Lesson.fromJson(obj as Map<String, dynamic>)).toList();
  }

  static Lesson _lessonFactory(String json) {
    return Lesson.fromJson(jsonDecode(json));
  }

  static Future<Lesson> localLessonFactory(String lessonName) {
    return loadLessonString().then((json) =>
        loadLessons(json).firstWhere((training) => training.title == lessonName));
  }

  static Future<List<String>> loadLessonNames() {
    return loadLessonString().then((value)
    => Lesson.loadLessons(value).map((lesson) => lesson.title).toList());
  }

  @override
  bool operator ==(other) {
    return (other is Lesson)
        && this.summary == other.summary
        && this.title == other.title
        && this.sources == other.sources
        && this.cards.length == other.cards.length;
  }

  @override
  int get hashCode {
    return this.summary.hashCode * (this.cards.length + 1);
  }

  static final emptyLesson = Lesson(cards: [], title: "", summary: "", sources: "");
}

class Card {
  final String text;

  Card({this.text});

  Card.fromJson(Map<String, dynamic> json)
    : text = (json['text'] as String);
}

// ---------------------------------------------
// QUIZZES
// ---------------------------------------------

class Quiz {
  final List<Question> questions;
  final String title;
  final String summary;
  final String sources;

  Quiz({this.questions, this.title, this.summary, this.sources});

  Quiz.fromJson(Map<String, dynamic> json)
    : questions = (json['questions'] as List).map((q) => Question.fromJson(q)).toList(),
      title = (json['title'] as String),
      summary = (json['summary'] as String),
      sources = (json['sources'] as String);

  static List<Quiz> _loadQuizzes(String json) {
    return ((jsonDecode(json))["quizzes"] as List<dynamic>)
        .map((obj) => Quiz.fromJson(obj as Map<String, dynamic>)).toList();
  }

  static List<Quiz> loadQuizzes(String json) {
    return ((jsonDecode(json))["quizzes"] as List<dynamic>)
        .map((obj) => Quiz.fromJson(obj as Map<String, dynamic>)).toList();
  }

  static Future<List<String>> loadQuizNames() {
    return loadQuizzesString().then((value)
    => Quiz.loadQuizzes(value).map((quiz) => quiz.title).toList());
  }
  
  static Quiz _quizFactory(String json) {
    return Quiz.fromJson(jsonDecode(json));
  }

  static Future<Quiz> localQuizFactory(String quizName) {
    return loadQuizzesString().then((json) =>
        _loadQuizzes(json).firstWhere((quiz) => quiz.title == quizName));
  }
  

  @override
  bool operator ==(other) {
    return (other is Lesson)
        && this.summary == other.summary
        && this.questions.length == other.cards.length;
  }

  @override
  int get hashCode {
    return this.summary.hashCode * (this.questions.length + 1);
  }

  static final emptyQuiz = Quiz(questions: [], title: "", summary: "", sources: "");
}

/// @Question This represents the Question model, including its representative types
/// the type 'mc' will have options filled, the type 'f' will not use options, just correct
class Question {
  final String text;
  final String type;
  final List<String> options; //used if the type of question is 'mc'
  final String correct;
  final String informativeMessage;

  Question({this.text, this.type, this.options, this.correct, this.informativeMessage});

  Question.fromJson(Map<String, dynamic> json)
    : text = (json['text'] as String),
      type = (json['type'] as String),
      options = (json['options'] as List)?.map((str) => str as String)?.toList(),
      correct = (json['correct'] as String).trim(),
      informativeMessage = (json['info'] as String);
}