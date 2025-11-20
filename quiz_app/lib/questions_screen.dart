import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

// https://pub.dev/packages/google_fonts/install
// https://docs.flutter.dev/cookbook/design/fonts

// always the first answer will be the answer but on ui we will shuffle the answer
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, //use as much as width you can
      child: Container(
        margin: EdgeInsets.all(40), //same margin in all directions
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // map returns a list, and children accepts only widgets hence spread the list
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}


// column() : 
// main axis: vertical axis
// cross axis: horizontal axis
// by default occupies th eentire available height but only the width required by its content (children )

// Row() : 
// main axis:horizontal axis vertical axis
// cross axis: vertical axis
// by default occupies th eentire available wisth but only the height required by its content (children )

// accesing list values in dart
// const hobbies=['cooking','reading']
// hobbies[0]->'cooking'
// hobbies[1]->'reading'
// hobbies[2]->error 

// const numbers=[1,2,3];
// numbers.shuffle();
// print(numbers);  ->[3,2,1], 
// shuffle changes the origianal list object 
// map doesn't change the original list