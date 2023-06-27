import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_list_app/models/response.dart';
import '../firebase_crud.dart';


class AddTaskService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<Response?> addTask(String position, String contactNo) async {

    try{
      var response = await FirebaseCrud.addEmployee(
        position: position,
        contactno: contactNo,
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

      else {
        Fluttertoast.showToast(
          msg: 'Data is Saved on DataBase',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
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