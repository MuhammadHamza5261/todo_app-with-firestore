

import '../../services/phone_auth_service/phone_auth_service.dart';

class PhoneAuthRepository{
  PhoneAuthService phoneAuthService = PhoneAuthService();


  Future<void> phoneAuthRepository({required String codeField}) async{

      phoneAuthService.phoneAuth(codeField);



   }

  }








