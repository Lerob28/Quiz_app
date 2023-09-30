import 'package:flutter/material.dart';
import 'package:simple_counter_app/constant/colors.dart';
import 'package:simple_counter_app/screen/question_screen.dart';

class ResultScreen extends StatefulWidget {

  const ResultScreen({required this.finalScore, Key? key}) : super(key: key);

  final int finalScore;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coloors.mainColor,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Text(
                 "Félicitations",
                 style: TextStyle(
                   color: Coloors.trueAnswerColor,
                   fontSize: 50,
                   fontWeight: FontWeight.bold,
                 ),
               ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              const Text(
                "Votre score est de",
                style:  TextStyle(
                  color: Coloors.initialBtnColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              Text(
                 "${widget.finalScore} / 100",
                 style: const TextStyle(
                   color: Coloors.trueAnswerColor,
                   fontSize: 50,
                   fontWeight: FontWeight.bold,
                 ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              MaterialButton(
                onPressed: () => _onPressed(),
                elevation: 5.0,
                color: Coloors.mainColor.withOpacity(0.3),
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Coloors.wrongAnswerColor, width: 2),
                    borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
                ),
                textColor: Colors.white,
                child:  Padding(
                  padding:  const EdgeInsets.all(20.0),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "Recommencer le Quizz"
                      ),
                      SizedBox(width: 10,),
                      Icon(
                        Icons.restart_alt_outlined,
                        size: 20,
                        color: Colors.white,
                      )
                    ],
                  ),
                ) ,
              )
            ],
          ),
        ),
      ),
    );
  }

  _onPressed() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const QuestionScreen()));
  }
}
