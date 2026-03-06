import 'package:flutter/material.dart';
import 'auth/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Market Screener',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
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

    // show logo for 2 seconds, then fade out and navigate
    Future.delayed(const Duration(seconds: 2), () {
      _fadeController.forward().then((_) {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const AuthScreen()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: Tween<double>(begin: 1.0, end: 0.0).animate(_fadeController),
          child: Image.asset(
            'assets/icons/logo_phone_splash_screen.png',
            // width: 200,
            // height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}