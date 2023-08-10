import 'package:flutter/material.dart';
import 'package:plantpal/services/auth_service.dart';
import 'package:provider/provider.dart';

import '../../config/image_string.dart';
import '../signup_screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  String? email;
  String? password;

  void _login() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    if (password == null && email == null) {
      return;
    }
    final response = await Provider.of<AuthService>(context, listen: false)
        .signInWithEmailAndPassword(email!, password!);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    final screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 200,
                height: screen_height * 0.35,
                child: Image.asset(top_splash_screen),
              ),
              SizedBox(
                width: double.infinity,
                height: screen_height * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sign in',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _form,
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              onSaved: ((value) {
                                email = value;
                              }),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              onSaved: ((value) {
                                password = value;
                              }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            _login();
                          },
                          child: const Text('SIGN IN'),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Forget Password?'))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screen_height * 0.15,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Don\'t have an account? '),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SignupScreen.routeName);
                    },
                    child: const Text('Sign up'),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
