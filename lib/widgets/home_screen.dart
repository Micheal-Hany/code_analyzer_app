import 'package:flutter/material.dart';

import '../services/complexity_analyzer.dart';
import '../theme/app_colors.dart';
import 'analysis_dashboard.dart';
import 'code_input.dart';
 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String code = '';
  ComplexityResult? analysisResult;

  void analyzeCode(String input) {
    final analyzer = ComplexityAnalyzer();
    setState(() {
      code = input;
      analysisResult = analyzer.analyze(input);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Code Complexity Analyzer'),
        elevation: 2,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: isWideScreen
          ? Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CodeInput(
                    onCodeSubmitted: analyzeCode,
                    initialValue: code,
                  ),
                ),
                if (analysisResult != null)
                  Expanded(
                    flex: 2,
                    child: AnalysisDashboard(
                      code: code,
                      complexityScores: analysisResult!.complexityScores,
                      optimizationTips: analysisResult!.optimizationTips,
                    ),
                  ),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  CodeInput(
                    onCodeSubmitted: analyzeCode,
                    initialValue: code,
                  ),
                  if (analysisResult != null)
                    AnalysisDashboard(
                      code: code,
                      complexityScores: analysisResult!.complexityScores,
                      optimizationTips: analysisResult!.optimizationTips,
                    ),
                ],
              ),
            ),
    );
  }
}
