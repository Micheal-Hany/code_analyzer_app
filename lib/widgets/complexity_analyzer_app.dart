import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_screen.dart';

class ComplexityAnalyzerApp extends StatelessWidget {
  const ComplexityAnalyzerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Code Complexity Analyzer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
