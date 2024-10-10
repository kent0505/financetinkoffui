import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../pages/activities_page.dart';

class ExpenseIncomeChart extends StatelessWidget {
  final List<Money> data;

  const ExpenseIncomeChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double totalIncome =
        data.where((d) => d.isIncome).fold(0, (sum, item) => sum + item.amount);
    double totalExpense = data
        .where((d) => !d.isIncome)
        .fold(0, (sum, item) => sum + item.amount);

    double maxValue = totalIncome > totalExpense ? totalIncome : totalExpense;

    double normalizedIncome = maxValue > 0 ? (totalIncome / maxValue) * 104 : 0;
    double normalizedExpense =
        maxValue > 0 ? (totalExpense / maxValue) * 104 : 0;

    return Center(
      child: Container(
        height: 285,
        width: 340,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: AppColors.white),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 104,
                  minY: -104,
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(),
                    ),
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barsSpace: -17,
                      barRods: [
                        BarChartRodData(
                          toY: 104,
                          width: 17,
                          color: const Color(0xFFCDCDCD).withOpacity(0.36),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        BarChartRodData(
                          toY: normalizedIncome,
                          width: 17,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        // Background bar (always displayed with #CDCDCD color)
                        BarChartRodData(
                          toY: -104,
                          width: 17,
                          color: const Color(0xFFCDCDCD).withOpacity(0.36),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        BarChartRodData(
                          toY: -normalizedExpense,
                          width: 17,
                          color: const Color(0xFF1F1F1F),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ],
                    ),
                  ],
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const TextB(
              'Mon',
              fontSize: 11,
              color: Color(0xff505050),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
