import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadTrainingString() {
  return rootBundle.loadString('lib/data/dir/trainings.json');
}

Future<String> loadQuizzesString() {
  return rootBundle.loadString('lib/data/dir/quizzes.json');
}

// ---------------------------------------------
// TRAINING
// ---------------------------------------------

class Training {
  final List<Card> cards;
  final String summary;
  final String title;
  final String sources;

  Training({this.cards, this.summary, this.title, this.sources});

  Training.fromJson(Map<String, dynamic> json)
    : cards = ((json['cards']) as List).map((l) => Card.fromJson(l)).toList(),
      summary = (json['summary'] as String),
      title = (json['title'] as String),
      sources = (json['sources'] as String);

  static List<Training> loadTrainings(String json) {
    return ((jsonDecode(json))["trainings"] as List<dynamic>)
        .map((obj) => Training.fromJson(obj as Map<String, dynamic>)).toList();
  }

  static Training _trainingFactory(String json) {
    return Training.fromJson(jsonDecode(json));
  }

  static Future<Training> localTrainingFactory(String trainingName) {
    return loadTrainingString().then((json) =>
        loadTrainings(json).firstWhere((training) => training.title == trainingName));
  }

  static Future<List<String>> loadTrainingNames() {
    return loadTrainingString().then((value)
    => Training.loadTrainings(value).map((training) => training.title).toList());
  }

  @override
  bool operator ==(other) {
    return (other is Training)
        && this.summary == other.summary
        && this.title == other.title
        && this.sources == other.sources
        && this.cards.length == other.cards.length;
  }

  @override
  int get hashCode {
    return this.summary.hashCode * (this.cards.length + 1);
  }

  static final emptyTraining = Training(cards: [], title: "", summary: "", sources: "");
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
    return (other is Training)
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