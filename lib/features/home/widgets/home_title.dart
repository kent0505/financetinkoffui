import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 40),
        const TextR('Your Balance', fontSize: 24),
        const Spacer(),
        CuperButton(
          onPressed: () {},
          minSize: 20,
          child: const Text(
            'History',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontFamily: Fonts.regular,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(width: 22),
      ],
    );
  }
}
