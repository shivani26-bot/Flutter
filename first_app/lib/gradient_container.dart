import "package:first_app/dice_roller.dart";
import "package:flutter/material.dart";
// import 'package:first_app/styled_text.dart';
// custom widgets (using classes)
// widgets=objects=data structures in memory , all the value types in end are also object  
// dart is an object oriented language,  every value is an object 
// class can extend or inherit from other classes 
// Stateless Widget comes from flutter framework

// use final if you don't want to reassing value 
// const tells value is compiled time constant 
final startAlignment= Alignment.topLeft;
final endAlignment= Alignment.bottomRight;


// approach 2
// this is wrong approach for widgets that have internally changing data, StatelessWidget are immutable 
// Use StatelessWidget if you have some input values and output some widget 
// if widget has some data that change internally and affect rendered ui use Statefulwidget, here image is displayed on the ui changes when button is clicked
// Statefulwidget allows us to manage state inside of them, state is data that change over time and impacts the rendered ui
// break into separate wdiget as only Image is changing , stateful will contain image and button 
class GradientContainer extends StatelessWidget{

  
//we can also accept individual color, defualt constructor function 
const GradientContainer(this.color1, this.color2, {super.key});
const GradientContainer.purple({super.key}):color1=Colors.deepPurple,color2=Colors.indigo;

//  GradientContainer(this.color1, this.color2, {super.key});
// GradientContainer.purple({super.key}):color1=Colors.deepPurple,color2=Colors.indigo;


final Color color1;
final Color color2;

// add the initial dice image , now we can't have const Constructor because we are using variable,now it's not a const class anymore, 
//we cannot create const and objects with it anymore that could be stored and reused from memory because now object can change internally becuase we have variable var, which could change
// var activeDiceImage='assets/images/dice-2.png';

// void rollDice(){
// activeDiceImage='assets/images/dice-4.png';
// print('Changing image...');
// }
  @override //overriding method that is expected by stateless widget
 
 Widget build(context){
// we must return a widget here 
return Container(
          // using container we can add gradient colors 
          decoration: BoxDecoration(
            // gradient: LinearGradient(colors: [Colors.deepPurple, Color.fromARGB(255, 229, 142, 12)],
            // use dynamic 
            gradient: LinearGradient(colors: [color1,color2],
            begin: startAlignment,
            end:endAlignment,
            ),
          ),
        
        // child: const Center(
        // add a button to roll the dice we need multiple widget inside Center now 
        // Center has only child argument , use Column Widget to provide multiple widget 
        // Column(): this widget allows multiple children above each other 
        //Row(): widget allows multiple children horizontally 
         child:  Center(
          // Column widget by defualt take all the available vertical space, it's centered horizontally 
          child: DiceRoller()
      ),
      //   child:  Center(
      //     //make styledtext dynamic
      //     // child: StyledText("Hello World!"),
      //     // use Image of dice 
      //     // a class can have multiple constructor function in dart , here Image is in built feature as dart 
      //     // For ex: Image has default constructor function Image() and multiple other constructor functions Image.asset() , Image.network() etch 
      //     // we can keep the Center widget as const now because this image widget is dynamic widget and not guranteed to be const 
      //     child: Image.asset('assets/images/dice-2.png',width:200)
      // ),
        );
  }

}

// extends StatelessWidget means this class is a widget that:
// Has no mutable state (its configuration doesn't change after construction).
// Must implement the build method which returns its subtree.
// var startAlignment= Alignment.topLeft;
// var endAlignment= Alignment.bottomRight;
// var key words can be reassigned that's why we can't add const before BoxDecoration or LinearGradient 

// approach 1 
// class GradientContainer extends StatelessWidget{
//   // to add some extra settings we nedd to add some extra settings or configuration at the point the widget is created we need to add our own constructor function
//   // key argument needs to be forwarded to StatelessWidget, StatelessWidget from which we are extendings wants a key Argument that's why your class should accept key argument as well 
//   // to reach out to parent class consturctor from which we are inheriting use super keyword 
//   // first key in super refers to parent key, second key refers to GradientContainer key 
//   // GradientContainer({key}): super(key:key)
//   // named arguments by default are optional with dart , hence use required
// //  const GradientContainer({super.key,required this.colors});//accept named argument key and forward it to superclass
// const GradientContainer(this.colors,{super.key});
// // const tells the dart that this is a class that can be optimized and reused 

// // we can assign the value received on the named argument in the constructor the the final parameter  using this.color 

// final List<Color>colors;//list can be modified
//   @override //overriding method that is expected by stateless widget
//   // build excepts a parameter ,called context or ctx , build method is execute for us by flutter 
//   // flutter calls build method once it finds our widget inside of some other widget or passed to the runApp function 
//   // when flutter dectects our widget in widget tree it will call build method and this method will then automatically recieve by flutter a value for the context parameter 
// // context -metadata object that contains some useful information about this widget in overall widget tree , like where this widget is positioned in overall widget 
//  Widget build(context){
// // we must return a widget here 
// return Container(
//           // using container we can add gradient colors 
//           decoration: BoxDecoration(
//             // gradient: LinearGradient(colors: [Colors.deepPurple, Color.fromARGB(255, 229, 142, 12)],
//             // use dynamic 
//                         gradient: LinearGradient(colors: colors,
//             begin: startAlignment,
//             end:endAlignment,
//             ),
//           ),
//         // backgroundColor: null,//no color 
//         // backgroundColor:Colors.deepPurpl e,
//         // backgroundColor: Color.fromARGB(255, 37, 16, 73),
//         child: const Center(
//           //make styledtext dynamic
//           child: StyledText("Hello World!"),
//       ),
//         );
//   }

// }



//  const GradientContainer({super.key});
// This is a constructor for GradientContainer.
// const before the constructor:
// Declares a const constructor, allowing callers to build the widget at compile time if all constructor arguments are compile-time constants.
// Const widgets can be canonicalized (re-used), reducing memory and rebuilds.
// {super.key}:
// This is a named optional parameter that forwards the key to the parent (StatelessWidget) constructor.

// It is shorthand for:
// GradientContainer({Key? key}) : super(key: key);
// key helps Flutter identify and preserve widgets during widget-tree changes (useful for lists, reordering, etc.).



// @override //overriding method that is expected by stateless widget
//   Widget build(context){
// @override tells the analyzer you intend to override a method from the superclass (StatelessWidget).
// Widget build(context) is the required method for stateless widgets:
// It’s called by the framework to describe the widget subtree.
// context is a BuildContext (type can be omitted for brevity). It contains metadata about where this widget lives in the widget tree and provides access to inherited widgets, theme, media queries, etc.
// build may be called many times (whenever the parent requests rebuilds); therefore it should be fast and without side effects.


// Container is a convenience widget that can combine common painting, positioning, and sizing widgets.
// It can have decoration, padding, margin, child, etc.
// In this case it’s used mainly to apply a gradient background via decoration.