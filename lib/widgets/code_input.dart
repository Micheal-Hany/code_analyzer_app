import 'package:flutter/material.dart';

class CodeInput extends StatelessWidget {
  final Function(String) onCodeSubmitted;
  final String initialValue;

  const CodeInput({
    super.key,
    required this.onCodeSubmitted,
    this.initialValue = '',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter your code:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 8,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Paste your code here...',
              ),
              controller: TextEditingController(text: initialValue),
              onChanged: onCodeSubmitted,
              style: const TextStyle(
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }
}