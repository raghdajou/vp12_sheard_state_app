import 'package:flutter/material.dart';
import 'package:vp12_sheard_state_app/pref/shared_pref_controller.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.blue,
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed:() async{
                  bool cleared = await SharedPrefController().clear();
                  if (cleared){
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  }

            },
                icon: Icon(Icons.logout),
            ),
          ],
        ),
       body: Center(
        child:Text(SharedPrefController().email) ,
    ) ,
    );

  }
}
