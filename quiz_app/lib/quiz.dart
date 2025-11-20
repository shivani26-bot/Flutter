import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

//      Quiz
// StartScreen   QuestionsScreen
// we manage and update some state in _QuizState class that is connected to quiz widget
// and rendering content conditionally (lifted state up) but we haven't connect the switchscreen function
// to the screen that contains the button that should trigger this switchScreen function
// we should make sure that the child widget that should inititate the state change, gets access to the state changing function defined in the parent widget
// functions are also regular values
class _QuizState extends State<Quiz> {
  // render the screen conditionally
  // we can store widgets in variables because widgets are object and objects are just regular values in dart
  // var will make this of type StartScreen type, in order to make it less restrictive so that it can include all type of widget
  // replace var with Widget

  // swictchScreen passes the fuction as value to start screen and inside the StartScreen Widget you can then use that function to call it whenever you want
  // here we ae passing a pointer at a switchScreen as a value to startScreen and in StartScreen widget we pass pointer at the anonymous function as a value to onPressed
  // Widget activeScreen = const StartScreen(switchScreen); //lifting the stateup

  // StartScreen should switch to QuestionsScreen once the Start quiz button was tapped,
  // StartScreen-> changes state that controls which screen is visible
  // QuestionsScreen-> depends on "which screen is visible?" state
  // we have two widgets which need to use the same state
  // hence we will lift the state up , Quiz widget is shared parent widget,if we manage
  // our state in quiz widget and also have the function for manipulating the state in there
  // we can conveniently move between StartScreen and QuestionsScreen by rendering content conditionally

  // both the variable ie activeScreen and method creation ie switchScreen happens at same point of time (when class is intantiated ) hence it's too early to reference the switchScreen (), because it's not
  // guaranteed that switchScreen() method exist at the point of variable initialization , use initState provided by State class to do some extra initialization work when the state object is created for the first time
  // initState will execute once after the object has been created and therefore in here we can indeed use all these variables and also reference this switchScreen function
  // but initState will then never execute thereafter again

  // 1st approach
  // Widget? activeScreen; //activescreen can also be null

  // @override
  // // initState is called just after the object was created, that is why activeScreen initially is null
  // //no need to wrap with setState as this runs before the build method runs, so the active screen will be set to right value before the build executes
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  //   //it should actually come first , before any additional work
  // }

  // 2nd approach to render our different screens conditionally without initState
  // final only complaints if we try to assign a new value to this variable , but it doesn't complain if we
  // try to modify in memory
  // final List<String> selectedAnswers = [];
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      //this reexecutes the build method and compare the result of executing that code to the result it got the last time it executed
      // the build method and if therre are differences it goes ahead and updates the rendered ui accordingly
      // activeScreen = const QuestionsScreen();
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  // pass chooseAnswer as value to questions screen
  void chooseAnswer(String answer) {
    // add : adds a new item to the list without reassigning that variable instead it reaches out to that list object in memory
    selectedAnswers.add(answer);
    // once we exhaust or answer all the questions we can go show result screen
    if (selectedAnswers.length == questions.length) {
      // we ran out of question switch to result window
      // setState(() {
      //   activeScreen = 'start-screen';
      // });

      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screeen';
    });
  }

  @override
  Widget build(context) {
    // build is executed when widget is rendered for the first time and after setSTate is called
    // 3rd approach
    // final becuase it's only set once whenever the build method runs either to start screen or to questions screen

    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();

    // 4th approach
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      // pass the answer to result screen
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 78, 13, 151),
                const Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),

          // child: activeScreen, // const used at class intantiation allows dart to reuse the object
          // child: activeScreen == 'start-screen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionsScreen(),
          child: screenWidget,
        ),
      ),
    );
  }
}
