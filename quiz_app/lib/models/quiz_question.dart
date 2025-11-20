class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // copy the list and then shuffle it, shuffle doesn't return a shuffled list, it shuffles inplace
    final shuffledList = List.of(answers); //we can't reassing the variable
    shuffledList.shuffle();
    return shuffledList;
  }
}

// shuffle mutates the original string, hence we can create a copy of answer list and then shuffle it and represent the answer on ui as shuffled


// final numbers=[1,2,3];//creates and stores a list object in memory
// numbers=[4,5,6];//tries to create a new list object and assign it to the existing numbers variable , doesn't work when using final 
// numbers.shuffle()-> reaches out to existing value in memory and edits internal data structure, doesn't try to re-assign the numbers variable 
