import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_counter_app/constant/colors.dart';

class TimerScreen extends StatefulWidget {
  static const int MAXSECONDS = 60;
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int seconds = TimerScreen.MAXSECONDS;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Coloors.mainColor.withOpacity(0.6),
        ),
        backgroundColor: Coloors.mainColor,
        body: Container(
          child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 _buildTimer(),
                 const SizedBox(height: 90),
                 _buildButtons(),
               ],
             )
          ),
        )
    );
  }

  _buildButtons() {
    final timerIsRunning = timer == null ? false : timer!.isActive;
    final timerIsCompleted = (seconds == TimerScreen.MAXSECONDS || seconds == 0 ) ? true : false;

    return timerIsRunning || !timerIsCompleted
        ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  timerIsRunning
                      ? _pauseTimer()
                      : _resumeTimer();
                },
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
                        timerIsRunning ? "Pausse Timer" : "Continue Timer",
                        style:  const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Icon(
                        timerIsRunning ? Icons.pause : Icons.play_arrow,
                        size: 20,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ),
            const SizedBox(width: 20),
            OutlinedButton(
                onPressed: () => _cancelTimer(),
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
                    children: const [
                      Text(
                        "Cancel Timer",
                        style:  TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Icon(
                        Icons.stop_circle,
                        size: 20,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ),
          ],
        )
        : OutlinedButton(
            onPressed: () => _startTimer(),
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
                  children: const [
                    Text(
                      "Start Timer",
                      style:  TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(
                      Icons.timer,
                      size: 20,
                      color: Colors.white,
                    )
                  ],
                ),
              )
          );
  }

  _buildTimer() {
    return SizedBox(
      height: 190,
      width:  190,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: (seconds / TimerScreen.MAXSECONDS),
            backgroundColor: Coloors.wrongAnswerColor,
            color: Coloors.trueAnswerColor,
            strokeWidth: 8.0,
          ),
          Center(
            child: Text(
              '$seconds',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 60.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _startTimer({bool resetTimer = true}) {
    if(resetTimer) {
      _resetTimer();
    }
    timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if(seconds > 0) {
        seconds--;
      } else {
        _pauseTimer();
      }
      setState(() {});
    });

  }

  _pauseTimer() {
    timer?.cancel();
    setState(() {});
  }

  _cancelTimer() {
    _resetTimer();
    _pauseTimer();
  }

  _resetTimer() {
    seconds = TimerScreen.MAXSECONDS;
    setState(() {});
  }

  _resumeTimer() {
    _startTimer(resetTimer: false);
  }

}
