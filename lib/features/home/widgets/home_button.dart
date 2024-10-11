import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    required this.id,
    required this.title,
    required this.onPressed,
  });

  final int id;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: CuperButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/home$id.svg'),
              const SizedBox(width: 6),
              TextR(title, fontSize: 16),
            ],
          ),
        ),
      ),
    );
  }
}
