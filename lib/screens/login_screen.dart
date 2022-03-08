import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vp12_sheard_state_app/pref/shared_pref_controller.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _PasswordTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _PasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _PasswordTextController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('LOGIN'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Text(
            'Welcome back...',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          const Text(
            'Enter your email & password',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.black45
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email)
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _PasswordTextController,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: const InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock)
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _preformLogin,
            child: const Text('LOGIN'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(0, 50),
            ),)
        ],
      ),
    );
  }

  void _preformLogin() {
    if (_checkData()) {
      login();
    }
  }

  bool _checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _PasswordTextController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar
        (content: Text('Enter email && password'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return false;
  }

  void login() async{
     await SharedPrefController().save(email: _emailTextController.text);
     //unawaited((SharedPrefController().save(email: (_emailTextController.text)) ));
    Navigator.pushReplacementNamed(context, '/home_screen');
  }
}
