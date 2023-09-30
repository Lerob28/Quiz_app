class QuestionModel {

  QuestionModel({
    required this.question,
    required this.answers
  });

  String question;
  Map<String, bool> answers;
}