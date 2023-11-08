import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    this.onTap,
  });

  final String answerText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 171, 2, 238),
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(answerText),
      ),
    );
  }
}
