# News App - Flutter

A modern Flutter news application that provides users with the latest news from various sources using the NewsAPI. The app features a clean UI with authentication, onboarding, and news browsing capabilities.

## Features

- 📱 **Cross-Platform Support**: Android, iOS, Web, Windows, Linux, and macOS
- 🔐 **Authentication**: Login and registration functionality
- 📰 **News Browsing**: Browse news from various sources
- 🎨 **Modern UI**: Clean and intuitive user interface
- 📱 **Responsive Design**: Optimized for different screen sizes
- 🌐 **WebView Integration**: Full article reading experience
- 📱 **Onboarding**: User-friendly introduction screens

## Screenshots

*Add screenshots of your app here*

## Prerequisites

Before running this project, make sure you have the following installed:

- **Flutter SDK** (version 3.9.2 or higher)
- **Dart SDK** (comes with Flutter)
- **Android Studio** (for Android development)
- **Xcode** (for iOS development, macOS only)
- **VS Code** or **Android Studio** (recommended IDEs)

## Installation

1. **Clone the repository**
   ```bash
   git clone <your-repository-url>
   cd new_app
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API Key** (See API Configuration section below)

4. **Run the application**
   ```bash
   flutter run
   ```

## API Configuration

This app uses the NewsAPI service to fetch news data. You need to configure your API key:

### Getting an API Key

1. Visit [NewsAPI.org](https://newsapi.org/)
2. Sign up for a free account
3. Get your API key from the dashboard

### Setting up the API Key

**Option 1: Direct Configuration (Current Setup)**
The API key is currently hardcoded in `lib/api/ApiConstants.dart`:
```dart
class ApiConstants{
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "YOUR_API_KEY_HERE"; // Replace with your actual API key
}
```

**Option 2: Environment Variables (Recommended for Production)**
For better security, consider using environment variables:

1. Create a `.env` file in the project root:
   ```
   NEWS_API_KEY=your_actual_api_key_here
   ```

2. Add `flutter_dotenv` to your `pubspec.yaml`:
   ```yaml
   dependencies:
     flutter_dotenv: ^5.1.0
   ```

3. Update `ApiConstants.dart`:
   ```dart
   import 'package:flutter_dotenv/flutter_dotenv.dart';
   
   class ApiConstants{
     static const String baseUrl = "newsapi.org";
     static String get apiKey => dotenv.env['NEWS_API_KEY'] ?? '';
   }
   ```

4. Load the environment in `main.dart`:
   ```dart
   import 'package:flutter_dotenv/flutter_dotenv.dart';
   
   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await dotenv.load(fileName: ".env");
     runApp(const MyApp());
   }
   ```

### API Endpoints Used

- **Sources API**: `/v2/top-headlines/sources` - Get available news sources
- **News API**: `/v2/everything` - Get news articles by source

## Project Structure

```
lib/
├── api/                    # API management
│   ├── ApiConstants.dart   # API configuration
│   ├── ApiManager.dart     # API service calls
│   └── EndPoints.dart      # API endpoints
├── customWidgits/          # Reusable UI components
│   ├── CustomElevatedButton.dart
│   └── CustomTextFormField.dart
├── models/                 # Data models
│   ├── NewsResponse.dart
│   └── SourceResponse.dart
├── ui/                     # User interface screens
│   ├── auth/              # Authentication screens
│   ├── home_screen/       # Home screen and related
│   └── onbording_screen/  # Onboarding screens
├── utiles/                # Utilities and constants
│   ├── AppColors.dart
│   ├── AppFonts.dart
│   ├── AppImages.dart
│   ├── AppRoutes.dart
│   └── TimeUtiles.dart
└── main.dart              # App entry point
```

## Dependencies

- **flutter_bloc**: State management
- **http**: HTTP requests
- **webview_flutter**: WebView for article reading
- **url_launcher**: URL launching functionality
- **flutter_native_splash**: Splash screen

## Building for Production

### Android
```bash
flutter build apk --release
# or for app bundle
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

### Desktop (Windows/Linux/macOS)
```bash
# Windows
flutter build windows --release

# Linux
flutter build linux --release

# macOS
flutter build macos --release
```

## Troubleshooting

### Common Issues

1. **API Key Issues**
   - Ensure your API key is valid and active
   - Check if you've exceeded the API rate limits
   - Verify the API key is correctly configured

2. **Build Issues**
   - Run `flutter clean` and `flutter pub get`
   - Ensure all dependencies are properly installed
   - Check Flutter and Dart SDK versions

3. **Platform-Specific Issues**
   - For Android: Check `android/app/build.gradle`
   - For iOS: Verify Xcode project settings
   - For Web: Check `web/index.html` configuration

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [NewsAPI](https://newsapi.org/) for providing the news data
- [Flutter](https://flutter.dev/) for the amazing framework
- [Material Design](https://material.io/) for design guidelines

## Support

If you encounter any issues or have questions, please:
1. Check the troubleshooting section above
2. Search existing issues in the repository
3. Create a new issue with detailed information

---

**Note**: Remember to replace the API key in `lib/api/ApiConstants.dart` with your actual NewsAPI key before running the application.
