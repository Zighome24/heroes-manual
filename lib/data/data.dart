import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadTrainings() {
  return rootBundle.loadString('lib/data/dir/trainings.json');
}

Future<String> loadQuizzes() {
  return rootBundle.loadString('lib/data/dir/quizzes.json');
}

class Training {
  final List<Card> cards;
  final String summary;
  final String title;

  Training({this.cards, this.summary, this.title});

  Training.fromJson(Map<String, dynamic> json, String trainingName)
    : cards = ((json['cards']) as List).map((l) => Card.fromJson(l)).toList(),
      summary = (json['summary'] as String),
      title = trainingName;


  static Training _trainingFactory(String json, String trainingName) {
    return Training.fromJson((jsonDecode(json))[trainingName], trainingName);
  }

  static Future<Training> localTrainingFactory(String trainingName) {
    return loadTrainings().then((json) => _trainingFactory(json, trainingName));
  }

  @override
  bool operator ==(other) {
    return (other is Training)
        && this.summary == other.summary
        && this.cards.length == other.cards.length;
  }

  @override
  int get hashCode {
    return this.summary.hashCode * (this.cards.length + 1);
  }

  static final emptyTraining = Training(cards: [], summary: "");
}

class Card {
  final String text;
  final String source;

  Card({this.text, this.source});

  Card.fromJson(Map<String, dynamic> json)
    : text = (json['text'] as String),
      source = (json['source'] as String);
}

class Quiz {
  final List<Question> questions;
  final String summary;

  Quiz({this.questions, this.summary});

  Quiz.fromJson(Map<String, dynamic> json)
    : questions = (json['questions'] as List).map((q) => Question.fromJson(q)),
      summary = (json['summary'] as String);

  static Quiz _quizFactory(String json, String quizName) {
    return Quiz.fromJson(jsonDecode(json)[quizName]);
  }

  static Future<Quiz> localQuizFactory(String quizName) {
    return loadQuizzes().then((json) => _quizFactory(json, quizName));
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
    : text = (json['text'] as String),
      type = (json['type'] as String),
      answer = json['answer'];
}