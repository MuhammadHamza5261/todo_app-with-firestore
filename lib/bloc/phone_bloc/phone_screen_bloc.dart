import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/bloc/phone_bloc/phone_screen_event.dart';
import 'package:todo_list_app/bloc/phone_bloc/phone_screen_state.dart';
import 'package:todo_list_app/bloc/todo_event.dart';
import 'package:todo_list_app/bloc/todo_state.dart';
import 'package:todo_list_app/repository/phone_auth_repository/phone_auth_repository.dart';
import 'package:todo_list_app/repository/todo_repository.dart';

class PhoneScreenBloc extends Bloc<PhoneEvent,PhoneScreenState>
{


  final phoneAuthRepository = PhoneAuthRepository();


  PhoneScreenBloc(): super(InitialState())
  {
    on<PhoneEvent>((event,emit) async
    {

      if(event is PhoneAuthEvent)
      {
        emit(PhoneInProgressState());
         // emit(sentCode());

        try
        {

        // if(event is PhoneAuthEvent){
        // emit(OtpVerified());
        //  }

          await phoneAuthRepository.phoneAuthRepository(
               codeField: event.codeField, context: event.context,
          );

        }

        catch(e)
        {
          emit(PhoneIsFailure(e.toString()));

        }


      }


      if(event is OtpSentEvent){

        emit(OtpSent());

      }



    });

  }
}
///
// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo_list_app/bloc/phone_bloc/phone_screen_event.dart';
// import 'package:todo_list_app/bloc/phone_bloc/phone_screen_state.dart';
//
// class OtpBloc extends Bloc<PhoneEvent, PhoneScreenState> {
//   OtpBloc() : super(InitialState());
//
//   @override
//   Stream<PhoneScreenState> mapEventToState(PhoneEvent event) async* {
//
//
//
//     if (event is SendOtpEvent) {
//       // yield OtpLoading();
//      emit(PhoneInProgressState());
//       // Send OTP logic
//       // Implement the logic to send OTP to the user's phone number
//       // You can use libraries like Firebase Authentication or Twilio for sending OTPs
//
//       // Assume OTP is successfully sent
//       emit(SendOtpEvent() as PhoneScreenState);
//       // yield OtpSent();
//
//     } else if (event is VerifyOtpEvent) {
//       // Verify OTP logic
//       // Implement the logic to verify the OTP entered by the user
//
//       // Assume OTP is successfully verified
//       // yield VerifyOtpEvent();
//
//     }
//   }
// }
