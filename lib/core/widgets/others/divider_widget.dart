import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      color: AppColors.white,
    );
  }
}
