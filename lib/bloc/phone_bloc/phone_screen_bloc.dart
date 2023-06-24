import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/bloc/phone_bloc/phone_screen_event.dart';
import 'package:todo_list_app/bloc/phone_bloc/phone_screen_state.dart';
import 'package:todo_list_app/bloc/to_event.dart';
import 'package:todo_list_app/bloc/to_state.dart';
import 'package:todo_list_app/repository/phone_auth_repository/phone_auth_repository.dart';
import 'package:todo_list_app/repository/todo_repository.dart';

class PhoneScreenBloc extends Bloc<PhoneAuthEvent,PhoneScreenState>
{


  final phoneAuthRepository = PhoneAuthRepository();


  PhoneScreenBloc(): super(InitialState())
  {
    on<PhoneAuthEvent>((event,emit) async
    {

      if(event is PhoneAuthEvent)
      {
        emit(PhoneInProgressState());


        try
        {
         await phoneAuthRepository.phoneAuthRepository(


               codeField: event.codeField,



          );
          //
          // if(){
          //   emit(PhoneDataIsLoadedState());
          // }

        }

        catch(e)
        {
          emit(PhoneIsFailure(e.toString()));

        }

      }

    });

  }
}