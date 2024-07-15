import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/constants.dart';

class PieChartWidget extends StatelessWidget {
  final int? totalViews;
  final int? completedViews;

  PieChartWidget({required this.totalViews, required this.completedViews});

  @override
  Widget build(BuildContext context) {
    final int validTotalViews = totalViews ?? 0;
    final int validCompletedViews = completedViews ?? 0;
    final double completedPercentage = validTotalViews != 0 ? (validCompletedViews / validTotalViews) * 100 : 0;
    final double remainingPercentage = 100 - completedPercentage;

    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: kAccentColor1,
            value: completedPercentage.toDouble(),
            title: '${completedPercentage.toStringAsFixed(1)}%',
            radius: 50,
            titleStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          PieChartSectionData(
            color: kAccentColor3,
            value: remainingPercentage.toDouble(),
            title: '',
            radius: 50,
          ),
        ],
      ),
    );
  }
}
