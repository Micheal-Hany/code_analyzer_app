import 'package:flutter/material.dart';

class OptimizationTips extends StatelessWidget {
  final List<String> tips;

  const OptimizationTips({
    super.key,
    required this.tips,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Optimization Suggestions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...tips.map((tip) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.lightbulb_outline, color: Colors.amber),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(tip),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}