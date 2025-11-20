// custom widget for answer button as styling will be same for all the answer button
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  // to add a dynamic answer text, use constructor
  // on clicking each button some function must execute
  // const AnswerButton(this.answerText, this.onTap, {super.key});
  // how to convert to named argument?
  // required because by default elements in named arguments are optional
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(answerText, textAlign: TextAlign.center),
    );
  }
}
