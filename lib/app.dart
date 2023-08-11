import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/theme/theme.dart';
import 'models/user_model.dart';
import 'screens/login_screen/login_screen.dart';
import 'screens/signup_screen/signup_screen.dart';

import 'screens/tab_screen/tab_screen.dart';
import 'screens/verify_email/verify_email_screen.dart';
import 'services/auth_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (ctx) => const Wrapper(),
          LoginScreen.routeName: (ctx) => const LoginScreen(),
          SignupScreen.routeName: (ctx) => const SignupScreen(),
          VerifyEmailScreen.routeName: (ctx) => const VerifyEmailScreen(),
          TabScreen.routeName: (ctx) => TabScreen(),
        },
        theme: AppTheme.apptheme,
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return const LoginScreen();
          } else {
            return const VerifyEmailScreen();
          }
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
