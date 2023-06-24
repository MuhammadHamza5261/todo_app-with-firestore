import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../models/response.dart';
import '../firebase_crud.dart';



class DeleteTaskService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  //firstly we can create a function
   Future<Response?> deleteTask(String id) async{

     try{

       var response = await FirebaseCrud.deleteEmployee(
            docId: id.toString(),
       );



       if (response.code != 200) {

         Fluttertoast.showToast(
           msg: 'Error Occurred',
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.black,
           textColor: Colors.white,
         );
       }

       else {
         Fluttertoast.showToast(
           msg: 'Data is Saved on DataBase',
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.black54,
           textColor: Colors.white,
         );
       }

       return response;


     }
     catch(e){
       throw Exception('Something went wrong');

     }

  }

}