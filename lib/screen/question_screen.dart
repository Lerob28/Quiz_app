
import 'package:flutter/material.dart';
import 'package:simple_counter_app/constant/colors.dart';
import 'package:simple_counter_app/data/question_list.dart';
import 'package:simple_counter_app/screen/result_screen.dart';
import 'package:audioplayers/audioplayers.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  final PageController _pageController = PageController(initialPage: 0);
  Color btnColor = Coloors.initialBtnColor;
  bool isPressed = false;
  int playerScore = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Coloors.mainColor.withOpacity(0.6),
      ),
      backgroundColor: Coloors.mainColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50.0,
            left: 20,
            right: 20,
          ),
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (page) => _handlePageChange(page),
            itemCount: questions.length,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text(
                    "Question ${index+1} / ${questions.length}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2.0,
                  color: Colors.white,
                  height: 35.0,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${questions[index].question} ?",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,

                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Expanded(
                    child: _answerBloc(index)
                ),
                const SizedBox(
                  height: 50,
                ),
                OutlinedButton(
                    onPressed: () => _onPressed(index, context),
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Coloors.mainColor.withOpacity(0.3),
                      elevation: 5.0,
                      side: const BorderSide(color: Coloors.wrongAnswerColor, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            (index + 1) != questions.length
                                ? "Question Suivante" :"Afficher Le Resultat",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 20,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                ),
                const SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

   _onPressed(int index, BuildContext context) {
      print('_onPressed function ...');
      print('isPressed = $isPressed');
      if(isPressed) {
        if((index + 1) == questions.length) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(finalScore: playerScore,)));
        }else {
          _handleNextQuestion();
        }
      }
    }

  handleAnswerPressed(int items, int position) {
     isPressed = !isPressed;
     if(isPressed) {
       if(questions[items].answers.entries.toList()[position].value){
         btnColor = Coloors.trueAnswerColor;
         playerScore += 100 ~/ questions.length;
       }else {
         btnColor = Coloors.wrongAnswerColor;
       }
     }else{
       btnColor = Coloors.initialBtnColor;
     }
     setState(() {});
  }

  ListView _answerBloc(int items) {
    return ListView.separated(
      shrinkWrap: false,
      physics: const ScrollPhysics(),
      itemCount: questions[items].answers.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 20.0,);
      },
      itemBuilder: (context, index) {
        return MaterialButton(
          onPressed: isPressed
              ? () {}
              : () => handleAnswerPressed(items, index),
          padding: const EdgeInsets.all(20.0),
          shape: const StadiumBorder(),
          color: isPressed
              ? questions[items].answers.entries.toList()[index].value
              ? Coloors.trueAnswerColor
              : Coloors.wrongAnswerColor
              :btnColor,
          child:  Text(
            questions[items].answers.keys.toList()[index],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        );
      },
    );
  }

  void _handleNextQuestion() {
    isPressed = false;
    btnColor = Coloors.initialBtnColor;
    _pageController!.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInCirc,
    );
    setState(() {});
  }

  _handlePageChange(int page) {
  }
}