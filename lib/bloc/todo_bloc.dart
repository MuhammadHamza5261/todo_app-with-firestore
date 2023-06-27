import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/bloc/todo_event.dart';
import 'package:todo_list_app/bloc/todo_state.dart';
import 'package:todo_list_app/repository/todo_repository.dart';


class ToDoBloc extends Bloc<ToDoEvent,ToDoState>
{

  final todoRespository = ToDoRepository();


  ToDoBloc(): super(ToDoInitial())
  {
    on<ToDoEvent>((event,emit) async
    {

      if(event is ToDoEvent)
      {
        emit(ToDoInProgressState());


        try
        {
          User? userInformation = await todoRespository.signupRepository(

              email: event.email,
              password: event.password,
          );

          if(userInformation != null){
            emit(ToDoDataIsLoadedState());
          }

        }

        catch(e)
        {
          emit(ToDoFailure(e.toString()));

        }

      }

    });

  }
}