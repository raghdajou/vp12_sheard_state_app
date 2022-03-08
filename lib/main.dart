import 'package:flutter/material.dart';
import 'package:vp12_sheard_state_app/pref/shared_pref_controller.dart';
import 'package:vp12_sheard_state_app/screens/home_screen.dart';
import 'package:vp12_sheard_state_app/screens/launch_screen.dart';
import 'package:vp12_sheard_state_app/screens/login_screen.dart';
void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(const MyAppp());
}
class MyAppp extends StatelessWidget {
  const MyAppp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/launch_screen',
   routes: {
    '/launch_screen' : (context)=> const LaunchScreen(),
    '/login_screen' : (context)=>  const LoginScreen(),
    '/home_screen' : (context)=>   const HomeScreen(),
        },

    );
  }
}
