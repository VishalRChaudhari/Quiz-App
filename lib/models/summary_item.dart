import 'package:flutter/material.dart';
import 'package:adv_basics/models/question_identifier.dart';


class SummaryItem extends StatelessWidget {
  const SummaryItem (this.itemData,{super.key});


  final Map<String,Object> itemData;
  @override
  Widget build(BuildContext context) {

   final isCorrect = itemData['User Answer '] == itemData['Correct Answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Questionidentifier(isCorrect: isCorrect, questionindex: itemData['Question Index'] as int),
                     const SizedBox(width: 20,),
                    Expanded(
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              itemData['Question'] as String,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              itemData['User Answer '] as String,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 237, 235, 133)),
                            ),
                            Text(
                              itemData['Correct Answer'] as String,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 116, 253, 116)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}

