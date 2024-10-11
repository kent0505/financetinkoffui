import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/others/divider_widget.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../money/bloc/money_bloc.dart';
import 'money_card.dart';

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyBloc, MoneyState>(
      builder: (context, state) {
        if (state is MoneyLoadedState) {
          return Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/income.svg',
                      color: AppColors.black,
                    ),
                    const SizedBox(width: 13),
                    const TextR('Income', fontSize: 18),
                    const Spacer(),
                    TextR('\$$totalIncomes', fontSize: 18),
                  ],
                ),
                const SizedBox(height: 4),
                const DividerWidget(margin: false),
                const SizedBox(height: 22),
                ...List.generate(
                  state.money.length,
                  (index) {
                    if (!state.money[index].expense) {
                      return MoneyCard(
                        money: state.money[index],
                        bottom: 8,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/expense.svg',
                      color: AppColors.black,
                    ),
                    const SizedBox(width: 13),
                    const TextR('Expense', fontSize: 18),
                    const Spacer(),
                    TextR('\$$totalExpense', fontSize: 18),
                  ],
                ),
                const SizedBox(height: 4),
                const DividerWidget(margin: false),
                const SizedBox(height: 22),
                ...List.generate(
                  state.money.length,
                  (index) {
                    if (state.money[index].expense) {
                      return MoneyCard(
                        money: state.money[index],
                        bottom: 8,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
