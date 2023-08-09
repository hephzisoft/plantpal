import 'package:flutter/material.dart';

import 'config/theme/theme.dart';
import 'screens/home_screen/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => const HomeScreen(),
      },
      theme: AppTheme.apptheme,
    );
  }
}
