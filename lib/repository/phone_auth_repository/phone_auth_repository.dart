

import 'package:flutter/cupertino.dart';

import '../../services/phone_auth_service/phone_auth_service.dart';

class PhoneAuthRepository{
  PhoneAuthService phoneAuthService = PhoneAuthService();


  Future<bool> phoneAuthRepository({required String codeField,required BuildContext context}) async{

     bool isOtpSent = await  phoneAuthService.phoneAuth(codeField,context);
     return isOtpSent;


   }

  }








