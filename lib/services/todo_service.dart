import 'package:firebase_auth/firebase_auth.dart';

class ToDoService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signup(String email, String password) async{
    try{
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
      );
      return userCredential.user;
    }
    catch(e){
      throw Exception('Something went wrong');
    }
  }
}

