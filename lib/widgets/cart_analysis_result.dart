import 'package:code_analyzer_app/services/complexity_anlyzer.dart';
import 'package:code_analyzer_app/widgets/chart.dart';
import 'package:code_analyzer_app/widgets/optimized_tips.dart';
import 'package:flutter/material.dart';

class AnalysisResultCard extends StatelessWidget {
  final ComplexityResult result;

  const AnalysisResultCard({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildComplexityCard(),
          const SizedBox(height: 16),
          _buildChartCard(),
          const SizedBox(height: 16),
          OptimizationTips(tips: result.optimizationTips),
        ],
      ),
    );
  }

  Widget _buildComplexityCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildComplexityRow(
              'Time Complexity',
              result.timeComplexity,
              Icons.timer,
            ),
            const SizedBox(height: 12),
            _buildComplexityRow(
              'Space Complexity',
              result.spaceComplexity,
              Icons.memory,
            ),
            const Divider(height: 24),
            Text(
              result.explanation,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Analysis Details:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...result.details.map((detail) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_right),
                      const SizedBox(width: 8),
                      Expanded(child: Text(detail)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildChartCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Complexity Analysis',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ComplexityChart(scores: result.complexityScores),
          ],
        ),
      ),
    );
  }

  Widget _buildComplexityRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
