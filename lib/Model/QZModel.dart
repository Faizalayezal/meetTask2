import 'dart:convert';

List<QuizModel> quizModelFromJson(String str) =>
    List<QuizModel>.from(json.decode(str).map((x) => QuizModel.fromJson(x)));

String quizModelToJson(List<QuizModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizModel {
  int? id;
  String? question;
  dynamic description;
  Answers? answers;
  String? multipleCorrectAnswers;
  CorrectAnswers? correctAnswers;
  String? correctAnswer;
  dynamic explanation;
  dynamic tip;
  // List<dynamic>? tags;
  dynamic category;
  dynamic difficulty;

  QuizModel({
    this.id,
    this.question,
    this.description,
    this.answers,
    this.multipleCorrectAnswers,
    this.correctAnswers,
    this.correctAnswer,
    this.explanation,
    this.tip,
    // this.tags,
    this.category,
    this.difficulty,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    id: json["id"],
    question: json["question"],
    description: json["description"],
    answers: Answers.fromJson(json["answers"]),
    multipleCorrectAnswers: json["multiple_correct_answers"],
    correctAnswers: CorrectAnswers.fromJson(json["correct_answers"]),
    correctAnswer: json["correct_answer"],
    explanation: json["explanation"],
    tip: json["tip"],
    // tags: json["tags"],
    category: json["category"],
    difficulty: json["difficulty"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "description": description,
    "answers": answers,
    "multiple_correct_answers": multipleCorrectAnswers,
    "correct_answers": correctAnswers,
    "correct_answer": correctAnswer,
    "explanation": explanation,
    "tip": tip,
    // "tags": tags,
    "category": category,
    "difficulty": difficulty,
  };
}

class Answers {
  String? answerA;
  String? answerB;
  String? answerC;
  String? answerD;
  String? answerE;
  String? answerF;

  Answers({
    this.answerA,
    this.answerB,
    this.answerC,
    this.answerD,
    this.answerE,
    this.answerF,
  });

  factory Answers.fromJson(Map<String, dynamic> json) => Answers(
    answerA: json["answer_a"],
    answerB: json["answer_b"],
    answerC: json["answer_c"],
    answerD: json["answer_d"],
    answerE: json["answer_e"],
    answerF: json["answer_f"],
  );

  Map<String, dynamic> toJson() => {
    "answer_a": answerA,
    "answer_b": answerB,
    "answer_c": answerC,
    "answer_d": answerD,
    "answer_e": answerE,
    "answer_f": answerF,
  };
}

class CorrectAnswers {
  String? answerACorrect;
  String? answerBCorrect;
  String? answerCCorrect;
  String? answerDCorrect;
  String? answerECorrect;
  String? answerFCorrect;

  CorrectAnswers({
    this.answerACorrect,
    this.answerBCorrect,
    this.answerCCorrect,
    this.answerDCorrect,
    this.answerECorrect,
    this.answerFCorrect,
  });

  factory CorrectAnswers.fromJson(Map<String, dynamic> json) => CorrectAnswers(
    answerACorrect: json["answer_a_correct"],
    answerBCorrect: json["answer_b_correct"],
    answerCCorrect: json["answer_c_correct"],
    answerDCorrect: json["answer_d_correct"],
    answerECorrect: json["answer_e_correct"],
    answerFCorrect: json["answer_f_correct"],
  );

  Map<String, dynamic> toJson() => {
    "answer_a_correct": answerACorrect,
    "answer_b_correct": answerBCorrect,
    "answer_c_correct": answerCCorrect,
    "answer_d_correct": answerDCorrect,
    "answer_e_correct": answerECorrect,
    "answer_f_correct": answerFCorrect,
  };
}