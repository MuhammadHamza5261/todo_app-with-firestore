import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/repository/google_repository/google_screen_repo.dart';

import 'google_screen_event.dart';
import 'google_screen_state.dart';

class GoogleScreenBloc extends Bloc<GoogleAuthEvent,GoogleScreenState>{


  final googleAuthRespository = GoogleAuthRepository();

  GoogleScreenBloc(): super(GoogleInitialState())
  {

    on<GoogleAuthEvent>((event,emit) async
        {


          if(event is GoogleAuthEvent)
            {
              emit(GoogleInProgressState());

              try{

                await googleAuthRespository.googleAuthRepository();

              }
              catch(e){
                emit(GoogleIsFailure(e.toString()));

              }

            }



        });




  }


}