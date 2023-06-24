import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_app/services/todo_service.dart';

class ToDoRepository{


  ToDoService toDoService  = ToDoService();

  Future<User?> signupRepository({required String email,required String password}) async{
    User? user = await toDoService.signup(email, password);

    return user;

  }

}