import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadLessonString() {
  return rootBundle.loadString('lib/data/dir/lessons.json');
}

Future<String> loadQuizzes() {
  return rootBundle.loadString('lib/data/dir/quizzes.json');
}

// ---------------------------------------------
// TRAINING
// ---------------------------------------------

class Lesson {
  final List<Card> cards;
  final String summary;
  final String title;

  Lesson({this.cards, this.summary, this.title});

  Lesson.fromJson(Map<String, dynamic> json)
    : cards = ((json['cards']) as List).map((l) => Card.fromJson(l)).toList(),
      summary = (json['summary'] as String),
      title = (json['title'] as String);

  // TODO: use this one to pull lesson names -> [].map(lesson -> lesson.title)
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
        && this.cards.length == other.cards.length;
  }

  @override
  int get hashCode {
    return this.summary.hashCode * (this.cards.length + 1);
  }

  static final emptyLesson = Lesson(cards: [], title: "", summary: "");
}

class Card {
  final String text;
  final String source;

  Card({this.text, this.source});

  Card.fromJson(Map<String, dynamic> json)
    : text = (json['text'] as String),
      source = (json['source'] as String);
}

// ---------------------------------------------
// QUIZZES
// ---------------------------------------------

class Quiz {
  final List<Question> questions;
  final String title;
  final String summary;

  Quiz({this.questions, this.title, this.summary});

  Quiz.fromJson(Map<String, dynamic> json)
    : questions = (json['questions'] as List).map((q) => Question.fromJson(q)).toList(),
      title = (json['title'] as String),
      summary = (json['summary'] as String);

  static List<Quiz> _loadQuizzes(String json) {
    return ((jsonDecode(json))["quizzes"] as List<dynamic>)
        .map((obj) => Quiz.fromJson(obj as Map<String, dynamic>)).toList();
  }

  static Quiz _quizFactory(String json) {
    return Quiz.fromJson(jsonDecode(json));
  }

  static Future<Quiz> localQuizFactory(String quizName) {
    return loadQuizzes().then((json) =>
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

  static final emptyQuiz = Quiz(questions: [], title: "", summary: "");
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
  //TODO: remove plain constructor, as it is simply for testing
  /*Question.plain(String text, String type, String answer) {
    this.text = text;
    this.type = type;
    this.answer = answer;
  }*/

  Question.fromJson(Map<String, dynamic> json)
    : text = (json['text'] as String),
      type = (json['type'] as String),
      options = (json['options'] as List)?.map((str) => str as String)?.toList(),
      correct = (json['correct'] as String).trim(),
      informativeMessage = (json['info'] as String);
}