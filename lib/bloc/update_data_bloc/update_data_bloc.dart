import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/bloc/update_data_bloc/update_data_event.dart';
import 'package:todo_list_app/bloc/update_data_bloc/update_data_state.dart';
import 'package:todo_list_app/repository/update_task_repository/update_task_repository.dart';
import '';
import 'package:todo_list_app/repository/add_task_repository/add_task_repository.dart';
import '../../models/response.dart';


class UpdateScreenBloc extends Bloc<UpdateScreenEvent,UpdateDataState>{


  final updateTaskRepository = UpdateTaskRepository();

  UpdateScreenBloc(): super(UpdateInitialState()) {
    on<UpdateScreenEvent>((event, emit) async{

      if(event is UpdateScreenEvent)
      {
        emit(UpdateInProgressState());


        try{

          Response? userData = await updateTaskRepository.updatetaskRepository(
              position: event.position,
              contactno: event.contactno,
              docId: event.DocUid,

          );

          if(userData  != null){
            emit(UpdateDataIsLoadedState());

          }

        }
        catch(e){
          emit(UpdateFailure(e.toString()));

        }

      }

    });

  }






}