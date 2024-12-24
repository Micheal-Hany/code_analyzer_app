import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme/app_colors.dart';

class ComplexityRadarChart extends StatelessWidget {
  final Map<String, double> scores;

  const ComplexityRadarChart({
    super.key,
    required this.scores,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxWidth < 600 ? 200.0 : 300.0;

        return SizedBox(
          height: size,
          child: RadarChart(
            RadarChartData(
              radarShape: RadarShape.polygon,
              tickCount: 5,
              ticksTextStyle: const TextStyle(color: Colors.transparent),
              radarBorderData: const BorderSide(color: AppColors.primary),
              gridBorderData:
                  BorderSide(color: AppColors.primary.withOpacity(0.2)),
              titlePositionPercentageOffset: 0.2,
              dataSets: [
                RadarDataSet(
                  fillColor: AppColors.primary.withOpacity(0.2),
                  borderColor: AppColors.primary,
                  entryRadius: 3,
                  dataEntries: scores.entries.map((entry) {
                    return RadarEntry(value: entry.value);
                  }).toList(),
                ),
              ],
              getTitle: (index, angle) {
                // Fetch the key for the axis and return a RadarChartTitle
                final title = scores.keys.elementAt(index);
                return RadarChartTitle(
                  text: title,
                  angle: angle, // Angle determines the title rotation
                );
              },
              titleTextStyle: TextStyle(
                color: AppColors.primary,
                fontSize: constraints.maxWidth < 600 ? 10 : 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
