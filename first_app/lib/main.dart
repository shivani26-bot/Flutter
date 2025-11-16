import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';
// custom function or instruction
// main-> function name, void ->return type
void main() {
  //-> defining function

  // runApp function and instruction that is provided by flutter
  // main job is to show some user interface ie getting the app up and running
  // functions must wrap instructions like this into other functions , create a custom functions void main()
  //Text is also widget
  // const allows start to reuse values that are indeed equal and avoid the duplication of data in memory, making your app more memory efficient
  // const helps dart optimize runtime performance , if we mark any widget as const , the widget will be stored internally in memory, and if we use same widget with same text again the existing memory will be reused
  // MaterialApp() is root widget important for setting up overall app
  // Scaffold() must be inside MaterialApp(), wrapped around the widgets that belong to a screen
  runApp(
    // widgets are just objects ie data structures in memory
    // container is a widget provided by flutter that doesn't support setting it to const and hence we can't set some parent widget to be const
   const MaterialApp(
      home: Scaffold(
        // we can make custom widgets also , we can take all the container part and use it as custom widget that applies background color to all the screens 
        body: GradientContainer(Color.fromARGB(255, 115, 48, 232), Colors.deepOrange), //this calls the constructor function of GradienContainer class , here we didn't add constructor function explicitly , thats automatically added to all classes 
      // body: GradientContainer.purple(), 
      ),
    ),
  );



  //-> executing function , must be executed inside of a function body, tell your program its coming from flutter
  // use atleast two core widgets offered by flutter to have a basic user interface
  // MaterialApp is a construtor function of a class, its a core widget used in all flutter apps, main widget used as starting
  // point passed to runApp in end because main widget does a lot of behind the scenes set up work for your user interface
  // we are creating app widget by calling MaterialApp() like this , we are telling to display this materialapp widget on the screen .
  // MaterialApp also need a  input value, regarding what should be displayed on the screen , the value should be about what should be shown inside app ui
}





  
// main function is special function in dart program , its the main enty point of dart app. it will be executed automatically by dart 
// when app becomes active on a device
// after code has been parsed and compiled , when it then executes on a device,the compiled version of your main function gets executed automatically 
// on that device by dart. hence no need to call main manually , instead it is executed for you 
// runApp tells flutter what to display on screen, so which ui elements shoudld be displayed on screen 
// runApp expects a input of type widget 
// flutter user interfaces are built with widgets , we combine many widgets with each other , we nest those widgets into each other to build user interface
// this forms a widget tree, 

//  https://docs.flutter.dev/ui/widgets

// void add({num1,num2}){//-> named parameters
//   num1+num2;
// }

// void demo(){
//   add(num2: 5, num1: 3);
// }

// in named parameters position doesn't matter how we pass the element 

// void add(num1,num2){//-> positional parameters
//   num1+num2; //num1=5, num2 =3
// }

// void demo(){
//   add( 5,  3);
// }