import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_app/services/otp_screen_service/otp_screen_service.dart';

class OtpScreenRepository{

  //first we can use the service class.
  OtpScreenService otpScreenService = OtpScreenService();


//  and then we create a function

  Future<User?> otpRepository({required String verify, required String code}) async{

    User? user = await otpScreenService.otpService(verify,code);

    return user;

   }

}