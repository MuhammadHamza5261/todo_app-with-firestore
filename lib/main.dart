import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/bloc/update_data_bloc/update_data_bloc.dart';
import 'package:todo_list_app/practise_Screen.dart';
import 'package:todo_list_app/ui/add_page.dart';
import 'package:todo_list_app/ui/google_auth_screen.dart';
import 'package:todo_list_app/ui/list_screen.dart';
import 'package:todo_list_app/ui/phone_0tp_screen.dart';
import 'dart:async';
import 'bloc/add_data_bloc/add_screen_bloc.dart';
import 'bloc/google_screen_bloc/google_screen_bloc.dart';
import 'bloc/phone_bloc/phone_screen_bloc.dart';
import 'bloc/to_bloc.dart';
import 'first_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<ToDoBloc>(create: (context) => ToDoBloc()),
          BlocProvider<PhoneScreenBloc>(create: (context) => PhoneScreenBloc()),
          BlocProvider<GoogleScreenBloc>(create: (context) => GoogleScreenBloc()),
          BlocProvider<AddScreenBloc>(create: (context) => AddScreenBloc()),
          BlocProvider<UpdateScreenBloc>(create: (context) => UpdateScreenBloc()),
        ],
        child: MyApp(),
      ));

}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   //add firebase in flutter project
//   await Firebase.initializeApp();
//   runApp(MyApp());
//
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>  AddPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const  SizedBox(
            height: 180,
          ),
          Center(
            child: Image.asset('assets/images/girl.png'),
          ),
          const Text(
            'To DO lIST APP',
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 35.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}


