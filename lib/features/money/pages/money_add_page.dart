import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class MoneyAddPage extends StatefulWidget {
  const MoneyAddPage({
    super.key,
    required this.expense,
  });

  final bool expense;

  @override
  State<MoneyAddPage> createState() => _MoneyAddPageState();
}

class _MoneyAddPageState extends State<MoneyAddPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: AppColors.white75,
      //   // borderRadius: const BorderRadius.vertical(
      //   //   top: Radius.circular(10),
      //   // ),
      // ),
      child: Stack(
        children: [
          Positioned(
            top: 14,
            right: 25,
            child: CuperButton(
              onPressed: () {
                context.pop();
              },
              minSize: 20,
              child: const TextM(
                'Close',
                fontSize: 16,
                color: AppColors.main,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
