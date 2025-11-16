
import "package:flutter/material.dart";

class StyledText extends StatelessWidget {
  // const StyledText(String text, {super.key});
// first way 
//  StyledText(String text, {super.key}):outputText=text;

// // add so called class variables , property to this class 
// // now this variable is avaiable in all the methods 
// String outputText; 
// @override
//   Widget build(context){
//     return Text(outputText ,style: const TextStyle(color: Colors.white,fontSize:28.5));
//   }

// second way 
// text is final → cannot change → widget remains immutable
// Constructor is const → allows Flutter optimizations
// Everything follows Flutter’s rule:
// ✔ Stateless widgets must be immutable
// This widget can be created as a compile-time constant if all its inputs are constant.
// shorthand to assign the constructor parameter directly to the class variable.
// Declares a const constructor, meaning an instance can be created at compile time if its arguments are compile-time constants.
// this.text is positional parameter shorthand:
// Equivalent to writing:
// final String text;
// const StyledText(String text, {Key? key}) : text = text, super(key: key);
// It declares a constructor parameter named text and assigns it to the instance field text.
// {super.key} again forwards an optional named key to the superclass.
// Because the constructor is const and the text field is final (see below), users can write:
// const StyledText("Hello") and the instance is a compile-time constant.
const StyledText(this.text, {super.key});

// Declares an immutable instance field.
// final means the field can be assigned once (usually in the constructor) and then cannot change.
// This immutability is crucial for StatelessWidget—the widget’s configuration must not change after construction.
// Using final allows the compiler and Flutter to reason about widget immutability and potential optimizations.
// add so called class variables , property to this class 
// now this variable is avaiable in all the methods 
final String text; 
@override

// build(context) returns a Text widget that displays the text field.
// Text(text, ...):
// The first parameter is the string to display. It’s the final String text provided when this widget was constructed.
// Important: text is a runtime value (unless the caller passed a compile-time constant string).
// style: const TextStyle(...):
// Uses a const TextStyle, which is allowed because the style properties (color, fontSize) are compile-time constants.
// const TextStyle(...) is deeply immutable, and Flutter can reuse it.
// You cannot write const Text(text, style: ...) if text is a runtime variable — const requires everything inside to be compile-time constants.
// This build is called whenever this widget needs rendering; the widget itself remains immutable.
  Widget build(context){
    return Text(text ,style: const TextStyle(color: Colors.white,fontSize:28.5));
  }

// this is wrong we cannot pass text like this 
  // @override
  // Widget build(context){
  //   return const Text(text ,style: TextStyle(color: Colors.white,fontSize:28.5));
  // }
  // @override
  // Widget build(context){
  //   return const Text('Hello World!',style: TextStyle(color: Colors.white,fontSize:28.5));
  // }
}


// A StatelessWidget is immutable.
// Once it's created, its build() method will always return the same UI as long as the inputs (constructor values) stay the same.
// class MyTitle extends StatelessWidget {
//   final String text;

//   const MyTitle({super.key, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 24),
//     );
//   }
// }


// This widget never changes by itself — it only updates if the text coming from the parent changes.
// Use StatelessWidget when:
// ✔ UI doesn't depend on internal changes
// Example:
// Text labels
// Icons
// Buttons with fixed behavior
// Layout widgets (Row, Column, Padding, Container with fixed style)

// ✔ UI depends only on values passed from parent
// Example:
// A product card receiving product data
// A custom button receiving a label from parent

// ✔ No need to store or update state inside the widget
// If you don't need:
// counters
// toggles
// animations
// form input
// API updates
// …then StatelessWidget is the right choice.

// final when the value is known at runtime but should not change once assigned
// Value is assigned only once.
// Value is immutable, but not necessarily compile-time constant.
// Useful for values available after program starts (e.g., from function calls, user input, DateTime).
// api response or user input 
// final username = getUserFromDatabase(); // runtime
// You don’t know the username until the program runs.
// final currentTime = DateTime.now();
// final numbers = [1, 2, 3];
// numbers.add(4); // allowed (modifying)
// numbers = [5, 6, 7]; // ❌ not allowed (reassigning)
// final name = "Shivani";
// name = "Kumari"; // ❌ cannot reassign
// class User {
//   final String id;       // value assigned once
//   final String name;     // runtime data

//   User(this.id, this.name);
// }

// void main() {
//   final user = User("123", "Shivani"); // runtime object
// }



// const when the value is known at compile time and will never change.
// Value must be compile-time constant.
// Can be used for deeply immutable objects.
// Allocated at compile time, not runtime.
// More optimized than final.
// const widgets → in Flutter to improve performance (widget doesn’t rebuild).
// const numbers = [1, 2, 3];
// numbers.add(4); // ❌ cannot modify const list
// const city = "Delhi";
// city = "Mumbai"; // ❌ cannot reassign
// class AppConfig {
//   static const maxBlogs = 5;
//   static const appName = "Blogscape";
// }
