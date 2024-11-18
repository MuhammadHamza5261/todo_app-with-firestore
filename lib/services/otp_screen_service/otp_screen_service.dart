import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/ui/otp_code_screen.dart';

import '../../ui/add_page.dart';
import '../../ui/phone_0tp_screen.dart';

class OtpScreenService{


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  // create a function
  Future<User?> otpService(String verify, String code) async {
    try{

        PhoneAuthCredential credential =  await PhoneAuthProvider.credential(
        verificationId: verifycodeSTF.verify,
        smsCode: code,

      );

    UserCredential userCredential =  await  _firebaseAuth.signInWithCredential(credential);

    return userCredential.user;



    }

     catch(e){
       // throw Exception('Something went wrong');
         throw Exception(e.toString());
    }


  }




}
