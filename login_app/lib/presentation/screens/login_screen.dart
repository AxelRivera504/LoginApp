import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';
  final int pageIndex;
  const LoginScreen({super.key, required this.pageIndex});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:Theme.of(context).colorScheme.tertiary,
        body: Center(
          child: Text('Login Screen',style: TextStyle(color: Colors.white))
        ),
      ),
    );
  }
}
