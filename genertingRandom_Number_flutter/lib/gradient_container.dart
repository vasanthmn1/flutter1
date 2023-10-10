import 'package:flutter/material.dart';
import 'dart:math';

class GradientContainer extends StatefulWidget {
  const GradientContainer(this.text, {super.key, required this.colors});

  final List<Color> colors;
  final String text;

  // @override

  @override
  State<GradientContainer> createState() => _GradientContainer();
}

class _GradientContainer extends State<GradientContainer> {
  var currentDiceNumber = 1;

  void rollDice() {
    setState(() {
      //  ! Random come  math  package
      currentDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // key: key,
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: widget.colors)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/dice-${currentDiceNumber}.png',
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 25)),
            child: const Text("Click"),
          )
        ],
      )),
    );
  }
}

 
// }
