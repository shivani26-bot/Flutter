import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// render content conditionally and lifting state up
class StartScreen extends StatelessWidget {
  // add a positional argument to startScreen ie startQuiz is a void function and takes no arguments, this is same as switchScreen in quiz.dart
  //  now we can call switchScreen function from inside StartScreen by executing startQuiz
  // const StartScreen(void Function() startQuiz, {super.key});
  const StartScreen(this.startQuiz, {super.key});
  // const in front of the constructor function : unlocks th eusage of const when intantiating the class

  // when widget class i created , and object is instantiated below startQuiz is set to the value we receive on the above startQuiz argument
  // now the below startQuiz can be used anywhere in this class
  final void Function() startQuiz;
  //now this is part of StartScreen and we can use this here
  @override
  Widget build(context) {
    return Center(
      child: Column(
        // it will take minimal vertical space as needed by the image
        mainAxisSize: MainAxisSize.min,
        children: [
          // first approach , if we need to reduce the opacity of image
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset('assets/images/quiz-logo.png', width: 300),
          // ),

          // second and better approach, color can be used to add an overlay color on top of the image
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(
              150,
              255,
              255,
              255,
            ), //150 tells the transparency
          ),

          const SizedBox(height: 80), //for spacing between two widget
          Text(
            'Learn Flutter the fun way!',

            // style: TextStyle(
            //   fontSize: 20,
            //   color: Color.fromARGB(255, 196, 138, 223),
            // ),
            style: GoogleFonts.lato(
              fontSize: 20,
              color: const Color.fromARGB(255, 196, 138, 223),
            ),
          ),
          const SizedBox(height: 30),
          // OutlinedButton(
          //   onPressed: () {},
          // style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          //   child: const Text('Start Quiz'),
          // ),
          OutlinedButton.icon(
            // onPressed: () {
            //   startQuiz();
            // },
            onPressed:
                startQuiz, //use the variable directly as in variable we store function void Function() startQuiz
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}

// neither scaffold nor container do by default take up any space themselves 
// hence center will expand to take the entire screen width and height and hence surrounding scaffold and container widgets 
// will apply their settings and decorations to the center widget 


// Column doesn't support const keyword 
