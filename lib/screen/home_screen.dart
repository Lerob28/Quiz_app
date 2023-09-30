import 'package:flutter/material.dart';
import 'package:simple_counter_app/constant/colors.dart';
import 'package:simple_counter_app/screen/question_screen.dart';
import 'package:simple_counter_app/screen/timer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Coloors.mainColor,
      appBar: AppBar(),
      drawer:  _customDrawer(context),
      body: const Center(
        child: Text(
          'Home Screen',
          style:  TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


  _customDrawer(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildHeader(context),
            _buildMenuItems(context),
          ],
        ),
      ),
    );
    return Drawer(
      backgroundColor: Coloors.mainColor.withOpacity(0.6),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 320.0),
          child: Column(
            children: [
              OutlinedButton(
                  onPressed: () => _navigateToTimerScreen(context),
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
                          "See Timer",
                          style:  TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(
                          Icons.alarm,
                          size: 50,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
              ),
              const SizedBox(height: 25),
              OutlinedButton(
                  onPressed: () => _navigateToQuestionScreen(context),
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
                          "Questions",
                          style:  TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(
                          Icons.question_mark,
                          size: 50,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildHeader(BuildContext context) => Material(
    child: Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: MediaQuery.of(context).padding.top,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.0),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Coloors.mainColor,
              Coloors.secondaryColor,
            ],
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
             CircleAvatar(
              radius: 50,
              backgroundColor: Coloors.secondaryColor,
              child: CircleAvatar(
                radius: 48,
                backgroundColor: Coloors.secondaryColor,
                child: Icon(Icons.account_circle, size: 80,),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "john Doe",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'visitor',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  _buildMenuItems(BuildContext context) => Column(
    children: [
      Container(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          children: [
            ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Mon Profil'),
                onTap: () =>  {
                  Navigator.of(context).pop(),
                }
            ),
            ListTile(
              leading: const Icon(Icons.timer),
              title: const Text('Counteur'),
              onTap: () => {
                Navigator.of(context).pop(),
                _navigateToTimerScreen(context),
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_mark),
              title: const Text('Questionnaire'),
              onTap: () => {
                Navigator.of(context).pop(),
                _navigateToQuestionScreen(context),
              },
            ),
            const Divider(color: Colors.white, thickness: 1),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text(' Déconnexion'),
              onTap: () => {
                Navigator.of(context).pop(),
                //_dialogBuilder(context),
              },
            ),
          ],
        ),
      ),
    ],
  );

  _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 40),
          content: const Text(
            "Voulez-vous vraiment vous Déconnecter ?",
            style: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child:  Text(
                      "Non",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/4,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child:  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Oui",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        );
      },
    );
  }

  _navigateToTimerScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TimerScreen()),
    );
  }
  _navigateToQuestionScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuestionScreen()),
    );
  }
}
