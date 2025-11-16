import 'package:flutter/material.dart';
import 'dart:math';


final randomizer= Random(); //only created once when this code files executes for the first time

// Just make sure that we use the dicerollerwidget that is connected to dicerollerstate  inside of gradient container
class DiceRoller extends StatefulWidget{
  // even though stateful widget is able to change internally because we have class separation , internally flutter in end make sure that state object can change which is why we don't add a const constructor to that 
  // but the widget will be kept constant by flutter  
  const DiceRoller({super.key});//accept the named key parameter and forward it to super class to stateful widget

  // here we don't add build() but we must add a createState()
  @override
  // doesn't take a value but returns a value ie State object 
  // State is generic to tell which kind of state will be managed here 
  State<DiceRoller> createState(){
    // return a state which has value of type DiceRoller
    // the value is created with a class , we always work with 2 classes when using Statefulwidget
    return _DiceRollerState(); //calling a diceroller state, executing constructor function of dicerollerstate, dart automatically adds constructor function by default, if we don't add by ourself
  }
}

// _-> means this class will be private , only be usable in this file, even if we import this file to another file other file not be able to access this State class
// as this state class is meant to be used internally by the diceroller Widget class 
class _DiceRollerState extends State<DiceRoller> {

  // how to get flutter to re-execute build method when activediceimage changes, call a special function in the place where we update a value that is used inside build and that will lead to some differnt ui output
// var activeDiceImage='assets/images/dice-2.png';
var currDiceRoll=2;
// by default flutter will simply ignore that you change your variable and doesn't reexecute the build method and reevaluate the ui 
// and it must re-execute the build method to pickup any channges to activediceimage, becuase if it changed the image on the screen will only 
// be updated if the build method executes again 
void rollDice(){ 

  // setState  (() { }); is provided by flutter that re-execute the build function 
  setState(() {
    //  whenever rollDice is executed we create a new random object and stored in memory and old random object will be thrown away 
    // this is a redundant object creation and deletion in memory 
    currDiceRoll=randomizer.nextInt(6)+1; //0 <> 5  -> 1 <> 6
    // activeDiceImage='assets/images/dice-$diceRoll.png';
  });


}

  @override
  Widget build (context){
     return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                // activeDiceImage,
                'assets/images/dice-$currDiceRoll.png',
                width:200),
                // it creates a box of certain size , it doesn't has any content , it's jsut the widget of that height , that just takes up that space without showing anything on the screen 
                // if we have any child inside sizedbox, that would not lead to sized box becoming wider or taller , sizedbox has fixed width and height  , it it have some content  that doesn't fit that content would be cutoff 
                // alternating to adding padding
                const SizedBox(height: 20),
                // ElevatedButton(onPressed: onPressed, child: child),
                // OutlinedButton(onPressed: onPressed, child: child),
                // for functions we can give anonymous funtion like this, or null , as Function is also object 
                // method1 
                // TextButton(onPressed: () {}, child: const Text('Roll Dice'))
                // mehtod2 : define method after constructors and variables 
                // we use function name to pass pointer to that function as a value passed to onPressed
                 TextButton(onPressed: rollDice, 
                 style: TextButton.styleFrom(
                  // we can also add widget between image and textbutton instead of padding called sizedbox() 
                  // padding: const EdgeInsets.only(top:20,), 
                  foregroundColor: Colors.white,textStyle: const TextStyle(fontSize: 28)),
                 child: const Text('Roll Dice'))
                ],
                ) ;
  }
}