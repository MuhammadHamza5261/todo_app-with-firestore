import 'package:todo_list_app/ui/google_auth_screen.dart';
import 'package:todo_list_app/ui/phone_0tp_screen.dart';
import 'package:todo_list_app/ui/Sign_with_firestore.dart';

import 'main.dart';
import 'package:flutter/material.dart';
class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: FirstScreensSTF(),
    );
  }
}
class FirstScreensSTF extends StatefulWidget {
  const FirstScreensSTF({Key? key}) : super(key: key);

  @override
  State<FirstScreensSTF> createState() => _FirstScreensSTFState();
}

class _FirstScreensSTFState extends State<FirstScreensSTF> {
  late double width;
  late double height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: height*0.07,
            ),
            Image.asset('assets/images/girl2.png'),
            SizedBox(
              height: height*0.02,
            ),
            SizedBox(
              height: height*0.066,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ToDoScreen1()));
                  },
                  child: const Text('Sign in with email and password',
                    style: TextStyle(
                    fontSize: 20.0,
                  ),),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: height*0.065,
               width: width*0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(10.0),
                  )
                ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const  PhoneScreen()));
                  },
                  child: Text('Sign with phone number',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: height*0.06,
               width: width*0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
                ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const GoogleScreen()));
                  } ,
                  child: const Text('Sign with Google',style: TextStyle(
                    fontSize: 20.0,
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

