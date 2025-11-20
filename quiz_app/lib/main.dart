import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/start_screen.dart';

// render content conditionally and lifting state up
void main() {
  runApp(const Quiz());
}

// Container() : used for adding padding or margin, set width and height, decorate with background color, align or position its child, transorm, rotate or scale its child
// It doesn't support const , because Container is used with properties that change at runtime
// const for a Container only when:Its size, color, decoration, and child widgets are all compile-time constants.
// BoxDecoration is a class used to style a Container (or other decorated boxes). It gives you background color, gradients, borders, shadows, and more. Think of it as the “paint and style” for a container.
