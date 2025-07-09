import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const name = 'signup-screen';
  final int pageIndex;
  const SignUpScreen({super.key, required this.pageIndex});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Sign Up Screen'),
        ),
      ),
    );
  }
}
