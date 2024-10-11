import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/money.dart';
import '../../../core/widgets/texts/text_r.dart';

class MoneyCard extends StatelessWidget {
  const MoneyCard({
    super.key,
    required this.money,
  });

  final Money money;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          TextR(money.title, fontSize: 16),
        ],
      ),
    );
  }
}
