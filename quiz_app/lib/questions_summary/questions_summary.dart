import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  //make the question screen as scrollable with fixed width and height
  @override
  Widget build(BuildContext context) {
    // here every row should represent one piece of summary data
    return SizedBox(
      height: 300,
      //it will give a fixed width and height to questions screen
      child: SingleChildScrollView(
        //if the child column exceeds the boundaries set around it like here height set by sizedbox, it become scrollable
        child: Column(
          // map returns a iterable object and it can be converted to list using toList()
          children: summaryData.map((data) {
            return SummaryItem(data);
            // max width of row widget is the maximum screen width , just as maximum height of column widget is the maximum height of the screen
            // return Row(
            //   // we are typecasting as data is map of string and object and object can be of any type, hence to tell the dart what type of data we are typecasting
            //   children: [
            //     Text(((data['question_index'] as int) + 1).toString()),
            //     Expanded(
            //       // without expanded , column takes an infinite amount of width, even if that goes beyond the screen boundaries
            //       //  expanded allows child to take the available space along the flex widgets main axis
            //       // if we use expanded inside a row the widget that is passed as a child to expanded, can't take more than the width of that row
            //       //  without expanded column inside of the row totally ignores the maximum width of the row and instead grows beyond that width
            //       //  with expanded its restricted to that width of that row and the column below will intead only expand such that it fills up the space provided by row
            //       child: Column(
            //         children: [
            //           Text(data['question'] as String),
            //           const SizedBox(height: 5),
            //           Text(data['user_answer'] as String),
            //           Text(data['correct_answer'] as String),
            //         ],
            //       ),
            //     ),
            //   ],
            // );
          }).toList(),
        ),
      ),
    );
  }
}


// Expanded is a Flutter widget used inside Row, Column, or Flex to make a child take up the available remaining space.
// It’s super useful when you want widgets to stretch, share space, or fill the layout proportionally.