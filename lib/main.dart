import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_selection_screen.dart';
import 'screens/user_login_screen.dart';
import 'screens/admin_login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/admin_dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final seenOnboarding = prefs.getBool('seenOnboarding') ?? false;
  runApp(MyVillageApp(seenOnboarding: seenOnboarding));
}

class MyVillageApp extends StatelessWidget {
  final bool seenOnboarding;
  MyVillageApp({required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Village',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Inter'),
      ),
      // First show splash, then decide
      home: SplashRouter(seenOnboarding: seenOnboarding),
      routes: {
        '/onboarding': (c) => OnboardingScreen(),
        '/login-selection': (c) => LoginSelectionScreen(),
        '/user-login': (c) => UserLoginScreen(),
        '/admin-login': (c) => AdminLoginScreen(),
        '/user-home': (c) => HomeScreen(),
        '/admin-dashboard': (c) => AdminDashboardScreen(),
      },
    );
  }
}

class SplashRouter extends StatelessWidget {
  final bool seenOnboarding;
  SplashRouter({required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      onFinished: () {
        if (seenOnboarding) {
          Navigator.of(context).pushReplacementNamed('/login-selection');
        } else {
          Navigator.of(context).pushReplacementNamed('/onboarding');
        }
      },
    );
  }
}
