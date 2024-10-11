import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/money.dart';
import '../../../core/utils.dart';
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
      margin: const EdgeInsets.only(bottom: 22),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(width: 9),
          SvgPicture.asset(
            money.income ? 'assets/income.svg' : 'assets/expense.svg',
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 25),
          SvgPicture.asset(
            getCategoryAsset(money.category),
            height: 36,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextR(money.title, fontSize: 16),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.main,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: TextR(
                          money.category,
                          fontSize: 14,
                          color: AppColors.black50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.main,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: TextR(
                          money.income ? 'Income' : 'Expense',
                          fontSize: 14,
                          color: AppColors.black50,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextR('\$${money.amount}', fontSize: 18),
          const SizedBox(width: 14),
        ],
      ),
    );
  }
}
