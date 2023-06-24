import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

   Future<String?> googleSignup() async{

    try{

        googleSignIn.signIn().then((value){
        String? userName = value!.displayName;
        String? profilePicture = value!.photoUrl;

      });


    }
    catch(e){

        throw Exception('Something went wrong');
    }


  }

}