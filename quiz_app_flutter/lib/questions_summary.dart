import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(
    this.summaryData, {
    super.key,
  });

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    // print('summaryData $summaryData');

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: data['user_answer'] == data['correct_answer']
                            ? const Color.fromARGB(255, 150, 198, 241)
                            : const Color.fromARGB(255, 249, 133, 241),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 22, 2, 56),
                        ),
                      )),
                  // Text(((data['question_index'] as int) + 1).toString()),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 202, 171, 252),
                            )),
                        Text(data['correct_answer'] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 181, 254, 246),
                            )),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
