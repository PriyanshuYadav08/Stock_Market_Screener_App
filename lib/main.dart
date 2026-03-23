import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'auth/auth.dart';
import 'dashboard/main_dashboard.dart';
import 'profile/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuantPulse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/auth': (context) => const AuthScreen(),
        '/dashboard': (context) => const MainDashboard(),
        '/profile': (context) => const ProfilePage(),
      },
      // start with splash screen, it will navigate to auth automatically
      home: const SplashScreen(),
    );
  }
}

/// simple splash screen that waits a moment and then pushes the auth screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    // show logo for 2 seconds, then fade out and navigate
    await Future.delayed(const Duration(seconds: 2));

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final prefs = await SharedPreferences.getInstance();
      final lastLogin = prefs.getInt('lastLogin') ?? 0;
      final now = DateTime.now().millisecondsSinceEpoch;
      const sevenDaysMs = 7 * 24 * 60 * 60 * 1000;

      if (now - lastLogin < sevenDaysMs) {
        // Still logged in, go to dashboard
        _fadeController.forward().then((_) {
          if (mounted) {
            Navigator.of(context).pushReplacementNamed('/dashboard');
          }
        });
      } else {
        // Auto logout, go to auth
        await FirebaseAuth.instance.signOut();
        _fadeController.forward().then((_) {
          if (mounted) {
            Navigator.of(context).pushReplacementNamed('/auth');
          }
        });
      }
    } else {
      // Not logged in, go to auth
      _fadeController.forward().then((_) {
        if (mounted) {
          Navigator.of(context).pushReplacementNamed('/auth');
        }
      });
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF05101d),
      body: Center(
        child: FadeTransition(
          opacity: Tween<double>(begin: 1.0, end: 0.0).animate(_fadeController),
          child: Image.asset(
            'assets/icons/square_logo.png',
          ),
        ),
      ),
    );
  }
}