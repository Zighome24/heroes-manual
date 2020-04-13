import 'dart:collection';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadTrainingString() {
  return rootBundle.loadString('lib/data/dir/trainings.json');
}

Future<String> loadQuizzesString() {
  return rootBundle.loadString('lib/data/dir/quizzes.json');
}

Future<String> loadMatrixString() {
  return rootBundle.loadString('lib/data/dir/matrix.json');
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

  static List<Training> _loadTrainings(String json) {
    return ((jsonDecode(json))["trainings"] as List<dynamic>)
        .map((obj) => Training.fromJson(obj as Map<String, dynamic>)).toList();
  }

  static Training _trainingFactory(String json) {
    return Training.fromJson(jsonDecode(json));
  }

  static Future<Training> localTrainingFactory(String trainingName) {
    return loadTrainingString().then((json) =>
        _loadTrainings(json).firstWhere((training) => training.title == trainingName));
  }

  static Future<List<String>> loadTrainingNames() {
    return loadTrainingString().then((value) =>
        _loadTrainings(value).map((training) => training.title).toList());
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

  static Future<List<String>> loadQuizNames() {
    return loadQuizzesString().then((value) =>
        _loadQuizzes(value).map((quiz) => quiz.title).toList());
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

// ---------------------------------------------
// MATRIX STUFF
// ---------------------------------------------

class Matrix {
  final LinkedHashMap<String, Stakeholder> matrix;

  Matrix({this.matrix});

  static final Matrix emptyMatrix = new Matrix();

  static Future<Matrix> localMatrixFactory() {
    return loadMatrixString().then((json) => _loadStakeholders(json));
  }

  static Matrix _loadStakeholders(String json) {
    List<Stakeholder> stakeholders = ((jsonDecode(json))["stakeholders"] as List<dynamic>)
        .map((obj) => Stakeholder.fromJson(obj as Map<String, dynamic>)).toList();
    return new Matrix(matrix: LinkedHashMap.fromIterable(stakeholders,
        key: (elem) => (elem as Stakeholder).title,
        value: (elem) => (elem as Stakeholder)));
  }
}

class Stakeholder {
  final String title;
  final List<String> actions;
  final List<Attitude> attitudes;
  final List<String> sources;

  Stakeholder({this.title, this.actions, this.attitudes, this.sources});

  Stakeholder.fromJson(Map<String, dynamic> json)
    : title = (json['title'] as String),
      actions = (json['actions'] as List).map((str) => str as String).toList(),
      attitudes = (json['attitudes'] as List).map((a) => Attitude.fromJson(a)).toList(),
      sources = (json['sources'] as List).map((str) => str as String).toList();

  @override
  bool operator ==(other) {
    return (other is Stakeholder)
        && title == other.title && actions == other.actions
        && attitudes == other.attitudes && sources == other.sources;
  }

  @override
  int get hashCode {
    return 17 * actions.hashCode * attitudes.hashCode
        * title.hashCode * sources.hashCode;
  }
}

class Attitude {
  final String facet;
  final String info;

  Attitude({this.facet, this.info});

  Attitude.fromJson(Map<String, dynamic> json)
    : facet = (json['facet'] as String),
      info = (json['info'] as String);

  @override
  bool operator ==(other) {
    return (other is Attitude)
        && other.facet == facet && other.info == other.info;
  }

  @override
  int get hashCode => facet.hashCode * info.hashCode * 17;
}