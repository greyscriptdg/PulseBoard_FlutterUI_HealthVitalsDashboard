# 🏥 PulseBoard - Health Vitals Dashboard

A modern, responsive Flutter UI dashboard for monitoring health vitals. Built with Material 3 design principles and supporting both light and dark themes.

## 📱 Features

- **Clean, Modern UI**: Material 3 design with smooth animations
- **Theme Support**: Light and dark mode with system preference detection
- **Responsive Layout**: Adapts to different screen sizes
- **Modular Architecture**: Easy to extend and maintain
- **Placeholder Cards**: Ready for real-time health data integration

## 🛠 Tech Stack

- Flutter
- Material 3
- Dart

## 📁 Project Structure

```
pulseboard_flutter_ui/
├── lib/
│   ├── main.dart                  # App entry point
│   ├── core/
│   │   ├── theme.dart             # Theme configuration
│   │   └── constants.dart         # App constants
│   ├── screens/
│   │   └── dashboard_screen.dart  # Main dashboard
│   ├── widgets/
│   │   ├── placeholder_card.dart  # Reusable card component
│   │   ├── heart_rate_chart.dart  # Animated heart rate chart
│   │   ├── steps_bar_chart.dart   # Animated steps chart
│   │   ├── sleep_chart.dart       # Animated sleep chart
│   │   ├── blood_pressure_chart.dart # Animated blood pressure chart
│   │   └── stress_chart.dart      # Animated stress gauge
│   └── data/
│       └── mock_vitals.dart       # Mock data (future use)
├── assets/
│   └── icons/                     # App icons
└── pubspec.yaml                  # Dependencies

```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.2.3)
- Dart SDK (>=3.2.3)
- iOS/Android development environment

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/pulseboard_flutter_ui.git
   ```

2. Navigate to the project directory:
   ```bash
   cd pulseboard_flutter_ui
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## 🎨 Design System

### Colors

- Primary: Deep Purple (#673AB7)
- Accent: Light Blue (#03A9F4)
- Background: Light Gray (#F5F5F5)
- Dark Background: Dark Surface (#121212)

### Vitals Card Colors

- Heart Rate: Pink (#E91E63)
- Steps: Green (#4CAF50)
- Sleep: Blue (#2196F3)
- Blood Pressure: Purple (#9C27B0)
- Stress: Orange (#FF9800)

## 📄 License

This project is licensed under the MIT License.

You are free to use, remix, and adapt this project for personal or commercial use.
📝 Attribution is required — please credit:
"UI design by Dhairya @ GreyScript Technologies"
Include this credit in your app's About section, README, or documentation.

## 🚀 Roadmap

- ✅ Add animated vitals (Heart, Sleep, Steps, BP, Stress)
- Build reusable HealthCard widgets with micro-interactions (Upcoming)
- Implement expandable bottom drawer with weekly views (Upcoming)
- Final polish for visual spacing and responsiveness (Upcoming)


## 🙌 Acknowledgements

If you use this project, drop us a ⭐ or tag us on LinkedIn/Twitter — we'd love to see what you build!

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

