# 📈 QuantPulse - Stock Market Screener App

A modern Flutter application for stock market screening and portfolio management, built with Firebase authentication and Google Sign-In.

## ✨ Features

- 🔐 **Secure Authentication**: Google Sign-In integration with Firebase
- 🏠 **Dashboard**: Clean main dashboard with bottom navigation
- 👤 **User Profile**: Personalized profile section with user details
- ⏰ **Auto-Login/Logout**: Automatic session management (7-day inactivity logout)
- 📱 **Responsive UI**: Beautiful, rounded bottom navigation with shadow effects
- 🎨 **Modern Design**: Dark theme with professional UI components

## 🚀 Getting Started

### Prerequisites

Before running this project, make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.8.1 or higher)
- [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) with Flutter extension
- [Firebase CLI](https://firebase.google.com/docs/cli) (optional, for Firebase setup)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/PriyanshuYadav08/Stock_Market_Screener_App.git
   cd Stock_Market_Screener_App
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Google Sign-In in Authentication > Sign-in method
   - Add your Android/iOS apps to Firebase project
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in the respective directories:
     - `android/app/google-services.json`
     - `ios/Runner/GoogleService-Info.plist`

4. **Configure Firebase Options**
   - Run `flutterfire configure` or manually update `lib/firebase_options.dart`

### Running the App

1. **For Android:**
   ```bash
   flutter run
   ```

2. **For iOS (macOS only):**
   ```bash
   flutter run --flavor development
   ```

3. **For Web:**
   ```bash
   flutter run -d chrome
   ```

4. **Build APK:**
   ```bash
   flutter build apk --release
   ```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point with routing
├── auth/
│   └── auth.dart            # Google Sign-In authentication
├── dashboard/
│   └── main_dashboard.dart  # Main dashboard with bottom nav
├── profile/
│   └── profile.dart         # User profile page
└── firebase_options.dart    # Firebase configuration
```

## 🛠️ Technologies Used

- **Flutter**: Cross-platform UI framework
- **Firebase Auth**: Authentication service
- **Google Sign-In**: OAuth authentication
- **Shared Preferences**: Local data storage for session management

## 🔄 Recent Updates

- ✅ Implemented Google Sign-In with Firebase
- ✅ Created responsive dashboard with bottom navigation
- ✅ Added user profile management
- ✅ Implemented auto-login for returning users
- ✅ Added 7-day inactivity auto-logout feature
- ✅ Designed modern UI with rounded navigation bar

## 🚧 Next Steps

The following features are planned for future development:

- 📊 **Stock Data Integration**: Connect to stock market APIs (Alpha Vantage, Yahoo Finance, etc.)
- 🔍 **Stock Search**: Implement search functionality for stocks
- 📈 **Real-time Charts**: Add interactive stock charts and graphs
- ⭐ **Favorites Management**: Save and manage favorite stocks
- 💼 **Portfolio Tracking**: Track investment portfolio performance
- 🔔 **Price Alerts**: Set up notifications for price changes
- 📊 **Market News**: Integrate financial news feeds
- 🌙 **Dark/Light Theme**: Toggle between themes
- 🔄 **Offline Mode**: Cache data for offline viewing
- 📱 **Push Notifications**: Firebase Cloud Messaging integration

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📞 Contact

Priyanshu Yadav - [GitHub](https://github.com/PriyanshuYadav08)

Project Link: [https://github.com/PriyanshuYadav08/Stock_Market_Screener_App](https://github.com/PriyanshuYadav08/Stock_Market_Screener_App)