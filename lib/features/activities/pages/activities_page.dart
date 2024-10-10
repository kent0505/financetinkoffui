import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_r.dart';
import '../widgets/expense_income_chart.dart';

class Money {
  final DateTime date;
  final int amount;
  final bool isIncome;
  Money({
    required this.date,
    required this.amount,
    required this.isIncome,
  });
}

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  List<Money> getCurrentDayExpensesAndIncomes(List<Money> data) {
    DateTime now = DateTime.now();
    return data.where((money) {
      return money.date.year == now.year &&
          money.date.month == now.month &&
          money.date.day == now.day;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextM('Activities', fontSize: 20),
        const SizedBox(height: 100),
        ExpenseIncomeChart(
          data: [
            Money(date: DateTime.now(), amount: 100, isIncome: true),
            Money(date: DateTime.now(), amount: 30, isIncome: false),
          ],
        ),
      ],
    );
  }
}
