class ComplexityResult {
  final String timeComplexity;
  final String spaceComplexity;
  final String explanation;
  final List<String> details;
  final List<String> optimizationTips;
  final Map<String, double> complexityScores;

  ComplexityResult({
    required this.timeComplexity,
    required this.spaceComplexity,
    required this.explanation,
    required this.details,
    required this.optimizationTips,
    required this.complexityScores,
  });
}

class ComplexityAnalyzer {
  ComplexityResult analyze(String code) {
    final timeComplexity = _analyzeTimeComplexity(code);
    final spaceComplexity = _analyzeSpaceComplexity(code);
    final optimizationTips = _generateOptimizationTips(code);

    return ComplexityResult(
      timeComplexity: timeComplexity,
      spaceComplexity: spaceComplexity,
      explanation: _generateExplanation(timeComplexity, spaceComplexity),
      details: _generateDetails(code),
      optimizationTips: optimizationTips,
      complexityScores: _calculateComplexityScores(code),
    );
  }

  String _analyzeTimeComplexity(String code) {
    if (code.contains('for') && code.contains('for')) {
      if (code.contains('while') || code.contains('for.*for.*for')) {
        return 'O(n³)';
      }
      return 'O(n²)';
    }
    if (code.contains('for') || code.contains('while')) {
      return 'O(n)';
    }
    if (code.contains('binary') || code.contains('divide')) {
      return 'O(log n)';
    }
    return 'O(1)';
  }

  String _analyzeSpaceComplexity(String code) {
    if (code.contains('new List') || code.contains('new Array')) {
      if (code.contains('for') && code.contains('for')) {
        return 'O(n²)';
      }
      return 'O(n)';
    }
    return 'O(1)';
  }

  List<String> _generateDetails(String code) {
    List<String> details = [];

    // Analyze loops
    if (code.contains('for') || code.contains('while')) {
      details.add('Contains iterative operations');
      if (code.contains('for') && code.contains('for')) {
        details.add('Nested loops detected - consider optimization');
      }
    }

    // Analyze recursion
    if (code.contains('function') &&
        code.contains('return') &&
        code.contains(RegExp(r'\w+\s*\('))) {
      details.add('Recursive operations detected');
    }

    // Analyze data structures
    if (code.contains('new Array') || code.contains('new List')) {
      details.add('Dynamic data structure allocation detected');
    }

    return details;
  }

  List<String> _generateOptimizationTips(String code) {
    List<String> tips = [];

    if (code.contains('for') && code.contains('for')) {
      tips.add(
          'Consider using a single loop with a hash map for O(n) complexity');
      tips.add('Try to avoid nested loops when possible');
    }

    if (code.contains('recursion')) {
      tips.add(
          'Consider using dynamic programming to avoid redundant calculations');
      tips.add('Implement memoization to cache results');
    }

    if (code.contains('new Array') || code.contains('new List')) {
      tips.add('Consider using fixed-size arrays when possible');
      tips.add('Reuse arrays instead of creating new ones');
    }

    return tips;
  }

  String _generateExplanation(String timeComplexity, String spaceComplexity) {
    return 'This code has a time complexity of $timeComplexity and a space complexity of $spaceComplexity. '
        'The time complexity indicates how the execution time grows with input size, while the space '
        'complexity shows memory usage growth.';
  }

  Map<String, double> _calculateComplexityScores(String code) {
    return {
      'Time Efficiency': _calculateTimeEfficiencyScore(code),
      'Space Efficiency': _calculateSpaceEfficiencyScore(code),
      'Code Quality': _calculateCodeQualityScore(code),
    };
  }

  double _calculateTimeEfficiencyScore(String code) {
    if (code.contains('for.*for.*for')) return 0.2;
    if (code.contains('for.*for')) return 0.4;
    if (code.contains('for') || code.contains('while')) return 0.6;
    if (code.contains('binary')) return 0.8;
    return 1.0;
  }

  double _calculateSpaceEfficiencyScore(String code) {
    if (code.contains('new Array.*new Array')) return 0.3;
    if (code.contains('new Array') || code.contains('new List')) return 0.6;
    return 0.9;
  }

  double _calculateCodeQualityScore(String code) {
    double score = 1.0;
    if (code.contains('for.*for')) score -= 0.2;
    if (code.length > 500) score -= 0.2;
    if (!code.contains('//')) score -= 0.1;
    return score.clamp(0.0, 1.0);
  }
}
