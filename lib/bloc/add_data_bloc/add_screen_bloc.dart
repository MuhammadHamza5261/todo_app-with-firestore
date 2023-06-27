import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import '';
import 'package:todo_list_app/repository/add_task_repository/add_task_repository.dart';
import '../../models/response.dart';
import 'add_screen_event.dart';
import 'add_screen_state.dart';

class AddScreenBloc extends Bloc<AddScreenEvent,AddScreenState>{


  final addTaskRepository = AddTaskRepository();

  AddScreenBloc(): super(AddInitialState()) {
    on<AddScreenEvent>((event, emit) async{

      if(event is AddScreenEvent)
        {
          emit(AddInProgressState());


          try{

            Response? userData = await addTaskRepository.addtaskRespository(
              position: event.position,
              contactNo: event.contact,

            );

             if(userData  != null){
               emit(AddDataIsLoadedState());

             }

          }
          catch(e){

            emit(AddFailure(e.toString()));

          }

        }

    });

  }

}