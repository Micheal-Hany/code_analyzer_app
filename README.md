# Code Complexity Analyzer

A modern Flutter application that analyzes code complexity and provides optimization suggestions. This tool helps developers understand and improve their code quality through visual metrics and actionable insights.

![Code Complexity Analyzer](https://github.com/yourusername/code-complexity-analyzer/raw/main/screenshots/demo.png)

## Features

- **Real-time Code Analysis**

  - Time complexity calculation
  - Space complexity evaluation
  - Code quality metrics
  - Nested loops detection

- **Visual Metrics**

  - Radar charts for complexity visualization
  - Progress indicators for different metrics
  - Color-coded performance indicators
  - Responsive design for all screen sizes

- **Optimization Suggestions**
  - Actionable improvement tips
  - Best practices recommendations
  - Performance optimization guidance

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/code-complexity-analyzer.git
```

2. Navigate to the project directory:

```bash
cd code-complexity-analyzer
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

## Usage

1. Enter or paste your code in the input section
2. The analysis will run automatically
3. View the complexity metrics in the dashboard
4. Check the optimization suggestions for improvements

## Architecture

The project follows a clean architecture pattern with the following structure:

```
lib/
├── services/          # Business logic and analysis
├── theme/            # UI theme and styling
└── widgets/          # Reusable UI components
```

## Dependencies

- `flutter_highlight`: ^0.7.0 - For code syntax highlighting
- `fl_chart`: ^0.63.0 - For data visualization
- `cupertino_icons`: ^1.0.2 - For iOS-style icons

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter team for the amazing framework
- FL Chart library for beautiful charts
- All contributors who help improve this project
