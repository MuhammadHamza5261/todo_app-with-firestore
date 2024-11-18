import 'package:todo_list_app/config/custom_button.dart';
import 'package:todo_list_app/ui/google_auth_screen.dart';
import 'package:todo_list_app/ui/phone_0tp_screen.dart';
import 'package:todo_list_app/ui/Sign_with_firestore.dart';
import 'package:flutter/material.dart';


class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: const FirstScreensSTF(),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/girl2.png'),
            SizedBox(
              height: height*0.02,
            ),

            CustomButton(
              height: height*0.06,
              width: width*0.9,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInScreen()));
                },
                text: 'Email and Password',
                color: Colors.green.shade200,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                height: height*0.06,
                width: width*0.9,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const  PhoneScreen()));
                },
                text: 'Phone Number',
                color: Colors.purple.shade200
            ),
             const SizedBox(
              height: 20.0,
            ),
            CustomButton(
                height: height*0.06,
                width: width*0.9,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const GoogleScreen()));
                },
                text: 'Sign in with Google',
                color: Colors.red.shade200
            ),
          ],
        ),
      ),
    );
  }
}

