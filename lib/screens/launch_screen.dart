import 'package:flutter/material.dart';
import 'package:vp12_sheard_state_app/pref/shared_pref_controller.dart';
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
    void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      String route = SharedPrefController().LoggedIn ? '/home_screen' : '/login_screen';
      Navigator.pushReplacementNamed(context, route);
  }
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade200,
            ]
          )
        ),
        child: const Text(
          'App Name',
          style:  TextStyle (
         fontWeight: FontWeight.bold,
         fontSize: 25
        ),),
      ),
    );
  }
}
