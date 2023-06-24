import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthService{

  bool isPhone = false;
  // final String text = codeField;
  // PhoneAuthService(this.codeField);

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> phoneAuth(String codeField) async{
    try{
         await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: codeField,
        verificationCompleted: (PhoneAuthCredential credential) {

          isPhone = true;

        },
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

         return true;


    }
    catch(e){
      throw Exception('Something went wrong');
    }
  }
}