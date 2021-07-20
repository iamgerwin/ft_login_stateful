import 'package:flutter/material.dart';
import 'package:login_stateful/src/screens/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log me in!',
      home: Scaffold(
        backgroundColor: Colors.amber[50],
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: LoginScreen()
          ),
        ),
      ),
    );
  }
}
