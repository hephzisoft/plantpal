import 'package:flutter/material.dart';

import 'config/theme/theme.dart';
// import 'screens/home_screen/home.dart';
import 'screens/login_screen/login_screen.dart';
import 'screens/signup_screen/signup_screen.dart';
import 'screens/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => const SplashScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        SignupScreen.routeName: (ctx) => const SignupScreen(),
      },
      theme: AppTheme.apptheme,
    );
  }
}
