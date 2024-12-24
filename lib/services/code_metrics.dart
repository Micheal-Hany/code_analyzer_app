import 'package:flutter/material.dart';

class CodeMetrics {
  static Map<String, MetricInfo> calculateMetrics(String code) {
    return {
      'Cyclomatic Complexity': MetricInfo(
        value: _calculateCyclomaticComplexity(code),
        description: 'Measures code path complexity',
        icon: Icons.account_tree,
      ),
      'Lines of Code': MetricInfo(
        value: _calculateLinesOfCode(code),
        description: 'Total lines excluding comments and blank lines',
        icon: Icons.format_list_numbered,
      ),
      'Comment Ratio': MetricInfo(
        value: _calculateCommentRatio(code),
        description: 'Percentage of code that is commented',
        icon: Icons.comment,
      ),
      'Nesting Depth': MetricInfo(
        value: _calculateNestingDepth(code),
        description: 'Maximum nesting level of code blocks',
        icon: Icons.layers,
      ),
    };
  }

  static double _calculateCyclomaticComplexity(String code) {
    int complexity = 1;
    complexity += RegExp(r'\bif\b|\bfor\b|\bwhile\b|\bcase\b').allMatches(code).length;
    return (complexity / 10).clamp(0.0, 1.0); // Normalize to 0-1
  }

  static double _calculateLinesOfCode(String code) {
    int lines = code.split('\n').where((line) => line.trim().isNotEmpty).length;
    return (1 - (lines / 200)).clamp(0.0, 1.0); // Normalize to 0-1, fewer lines is better
  }

  static double _calculateCommentRatio(String code) {
    int commentLines = RegExp(r'\/\/.*|\/\*[\s\S]*?\*\/').allMatches(code).length;
    int totalLines = code.split('\n').length;
    return (commentLines / totalLines).clamp(0.0, 1.0);
  }

  static double _calculateNestingDepth(String code) {
    int maxDepth = 0;
    int currentDepth = 0;
    
    for (var char in code.split('')) {
      if (char == '{') {
        currentDepth++;
        maxDepth = maxDepth > currentDepth ? maxDepth : currentDepth;
      } else if (char == '}') {
        currentDepth--;
      }
    }
    
    return (1 - (maxDepth / 5)).clamp(0.0, 1.0); // Normalize to 0-1, lower nesting is better
  }
}

class MetricInfo {
  final double value;
  final String description;
  final IconData icon;

  MetricInfo({
    required this.value,
    required this.description,
    required this.icon,
  });
}