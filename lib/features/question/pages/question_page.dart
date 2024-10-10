import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_r.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextM('Question', fontSize: 20),
      ],
    );
  }
}
