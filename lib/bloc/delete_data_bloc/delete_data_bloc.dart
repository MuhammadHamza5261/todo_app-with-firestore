import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:todo_list_app/bloc/delete_data_bloc/delete_data_event.dart';
import 'package:todo_list_app/bloc/delete_data_bloc/delete_data_state.dart';
import 'package:todo_list_app/repository/delete_task_repository/delete_task_repository.dart';

class DeleteDataBloc extends Bloc<DeleteDataEvent,DeleteDataState>{

 final deleteTaskRepository = DeleteTaskRepository();


   DeleteDataBloc(): super(DeleteInitialState()){
   on<DeleteDataEvent>((event,emit) async{

     if(event is DeleteDataEvent) {
       emit(DeleteDataInProgressState());


       try {

         Response? userData = (await deleteTaskRepository.deleteTaskRespository(
             id: event.id,
         ))as Response?;


         if(userData != null){
           emit(DeleteDataIsLoadedState());

         }
       }
       catch (e) {
         emit(DeleteFailure(e.toString()));

       }
      }

    });

   }

   }
