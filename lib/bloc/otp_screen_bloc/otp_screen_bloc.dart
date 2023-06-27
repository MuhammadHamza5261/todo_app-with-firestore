import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/repository/otp_screen_repository/otp_screen_repository.dart';
import 'otp_screen_event.dart';
import 'otp_screen_state.dart';

class OtpScreenBloc extends Bloc<OtpEvent,OtpScreenState>{

//  use the repository class
 final otpScreenRepository = OtpScreenRepository();

 OtpScreenBloc():super(OtpInitialState()){
  on<OtpEvent>((event,emit) async{

   if(event is OtpScreenEvent){

    emit(OtpInProgressState());

    try{
     User? userInformation = await otpScreenRepository.otpRepository(
         verify: event.verify,
         code: event.code,
     );


     if(userInformation != null){
      emit(OtpVerifiedState());
     }

    }

     catch(e){

     emit(OtpIsFailure(e.toString()));

     }

   }

    if(event is OtpDone){
     emit(OtpVerifiedState());

    }



  });



 }


}