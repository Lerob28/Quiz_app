import 'package:simple_counter_app/model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    question: 'Quel est le Pays le plus grand du monde',
    answers: {
      'Cameroun': false,
      'Togo': false,
      'Senegal': false,
      'Maroc': true,
    },
  ),
  QuestionModel(
    question: 'Combien de fois la terre tourne sur elle meme en une journee',
    answers: {
      '153': false,
      '25': true,
      '89': false,
      '12': false,
    },
  ),
  QuestionModel(
    question: "combien de village compte l'oeust cameroun",
    answers: {
      '8': false,
      '55': true,
      '12': false,
      '76': false,
    },
  ),
  QuestionModel(
    question: "qui fut le tout premier chef bamena",
    answers: {
      'Kameni tomas alex': false,
      'Borel Njeunkwe': false,
      'Raoul Nangue': true,
      'Mbeulong Andre Pierre': false,
    },
  ),
  QuestionModel(
    question: "Quel surnom donne t'on au peuple Bamena",
    answers: {
      'Beau regard': false,
      'Voleur de chèvre': true,
      'Abeilles du desert': false,
      'Tortue braisée': false,
    },
  ),
];