import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("The Questions"),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(onPressed: () {}, child: Text("Click")),
        ElevatedButton(onPressed: () {}, child: Text("Click")),
        ElevatedButton(onPressed: () {}, child: Text("Click")),
        ElevatedButton(onPressed: () {}, child: Text("Click")),
      ]),
    );
  }
}
