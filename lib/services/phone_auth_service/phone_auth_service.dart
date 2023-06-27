

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/bloc/phone_bloc/phone_screen_bloc.dart';
import 'package:todo_list_app/ui/add_page.dart';
import 'package:todo_list_app/ui/otp_code_screen.dart';

import '../../bloc/phone_bloc/phone_screen_event.dart';
import '../../ui/phone_0tp_screen.dart';

class PhoneAuthService{


  bool isPhone = false;
  // final String text = codeField;
  // PhoneAuthService(this.codeField);

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> phoneAuth(String codeField,BuildContext context) async{
    try{


         await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: codeField,
        verificationCompleted: (PhoneAuthCredential credential) {

          isPhone = true;


        },

        verificationFailed: (FirebaseAuthException e) {
          throw Exception(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          verifycodeSTF.verify = verificationId;
///
         BlocProvider.of<PhoneScreenBloc>(context).add(OtpSentEvent());

        },

        codeAutoRetrievalTimeout: (String verificationId) {
          isPhone = false;
        },
      );

         return isPhone;

    }
    catch(e){
      throw Exception('Something went wrong');
    }
  }
}