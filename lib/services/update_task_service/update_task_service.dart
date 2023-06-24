import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_list_app/models/response.dart';

import '../firebase_crud.dart';

class UpdateTaskService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    Future<Response?> updateTask(String position, String contactno,String docId) async{

    try{
      var response = await FirebaseCrud.updateEmployee(
        position: position,
        contactno: contactno,
        docId: docId,

      );

      if (response.code != 200) {

        Fluttertoast.showToast(
          msg: 'Error Occurred',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
        );
      }

      else
      {
        Fluttertoast.showToast(
          msg: 'Data is Saved on DataBase',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );

        return response;
      }


    }
    catch(e){
      throw Exception('Something went wrong');

    }






  }







}