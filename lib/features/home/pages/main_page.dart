import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_r.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextM('Main', fontSize: 20),
      ],
    );
  }
}
