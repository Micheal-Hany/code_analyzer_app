import 'package:flutter/material.dart';
import '../services/code_metrics.dart';
import '../theme/app_colors.dart';
import 'metric_card.dart';
import 'complexity_radar_chart.dart';
import 'optimization_tips.dart';

class AnalysisDashboard extends StatelessWidget {
  final String code;
  final Map<String, double> complexityScores;
  final List<String> optimizationTips;

  const AnalysisDashboard({
    super.key,
    required this.code,
    required this.complexityScores,
    required this.optimizationTips,
  });

  @override
  Widget build(BuildContext context) {
    final metrics = CodeMetrics.calculateMetrics(code);
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Code Analysis Dashboard',
              style: TextStyle(
                fontSize: isSmallScreen ? 20 : 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            _buildMetricsGrid(metrics, isSmallScreen),
            const SizedBox(height: 24),
            _buildComplexitySection(isSmallScreen),
            const SizedBox(height: 24),
            OptimizationTips(tips: optimizationTips),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricsGrid(Map<String, MetricInfo> metrics, bool isSmallScreen) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isSmallScreen ? 1 : 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: metrics.length,
      itemBuilder: (context, index) {
        final entry = metrics.entries.elementAt(index);
        return MetricCard(
          title: entry.key,
          value: entry.value.value,
          description: entry.value.description,
          icon: entry.value.icon,
        );
      },
    );
  }

  Widget _buildComplexitySection(bool isSmallScreen) {
    return Card(
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary.withOpacity(0.1),
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Complexity Analysis',
              style: TextStyle(
                fontSize: isSmallScreen ? 18 : 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            ComplexityRadarChart(scores: complexityScores),
          ],
        ),
      ),
    );
  }
}