import 'package:flutter/material.dart';
// import 'question.dart';
import 'AppBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


AppBrain appBrain= AppBrain();
void main() {
  runApp(QuizzApp());
}
class QuizzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
         backgroundColor: Colors.grey[300],
         appBar:AppBar(
           backgroundColor:Colors.grey,
           title:Text('Quizz',style:TextStyle(
               color:Colors.white)),
         ),
         body:Padding(
           padding: const EdgeInsets.all(20.0),
           child: ExamPage(),
         ),

      ),

    );


  }
}


class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerIcons=[];
  var rightAnswers=0;

  void CheckAnswer(bool answer){
    bool correctanswer=appBrain.getQuestionAnswer();

    if(answer==correctanswer){
      rightAnswers++;
      print('your answer is correct');
      answerIcons.add(  Padding(
        padding: const EdgeInsets.all(3),
        child: Icon(
          Icons.thumb_up,
          color:Colors.green,
        ),
      ),
      );

    }
    else{
      print("your answer is incorrect");
      answerIcons.add(  Padding(
        padding: const EdgeInsets.all(3),
        child: Icon(
          Icons.thumb_down,
          color:Colors.red,
        ),
      ),
      );

    }
    setState(() {
      if(appBrain.isFinished()==true){
        Alert(
          context: context,
          title: "Finished",
          desc: "you answered $rightAnswers answers right",
          buttons: [
            DialogButton(
              child: Text(
                "try again ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color:Colors.blue,
              width: 120,
            )
          ],
        ).show();
        appBrain.reset();
        answerIcons=[];
        rightAnswers=0;
      }
      else{
        appBrain.incrementNumber();
      }
    });
  }





  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children:
            answerIcons,

        ),
        Expanded(
          flex: 5,
          child:Column(children:[
            Image.asset(appBrain.getQuestionImage()),
            SizedBox(height:20),
            Text(appBrain.getQuestionText(),
            textAlign: TextAlign.center,
            style:TextStyle(
              fontSize:24,
              fontWeight:FontWeight.bold,
            ),
            )

          ],
          ),
        ),


        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.indigo),
              onPressed: () {
                CheckAnswer(true);
              },
              child: Text('True', style: TextStyle(fontSize: 22.0, color: Colors.white)),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.deepOrange),
              onPressed: () {
                CheckAnswer(false);
              },

              child: Text('False', style: TextStyle(fontSize: 22.0, color: Colors.white)),
            ),
          ),
        )
      ],

    );


  }
}