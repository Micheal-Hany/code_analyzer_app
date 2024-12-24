import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ComplexityChart extends StatelessWidget {
  final Map<String, double> scores;

  const ComplexityChart({
    super.key,
    required this.scores,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 1,
          barGroups: scores.entries.map((entry) {
            return BarChartGroupData(
              x: scores.keys.toList().indexOf(entry.key),
              barRods: [
                BarChartRodData(
                  toY: entry.value,
                  color: _getColor(entry.value),
                  width: 20,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            );
          }).toList(),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      scores.keys.elementAt(value.toInt()),
                      style: const TextStyle(fontSize: 12),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 0.2,
                getTitlesWidget: (value, meta) {
                  return Text(
                    '${(value * 100).toInt()}%',
                    style: const TextStyle(fontSize: 12),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getColor(double value) {
    if (value < 0.4) return Colors.red;
    if (value < 0.7) return Colors.orange;
    return Colors.green;
  }
}