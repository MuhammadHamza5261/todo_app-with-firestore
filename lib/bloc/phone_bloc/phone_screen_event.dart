import 'package:flutter/material.dart';

abstract class PhoneEvent{}

class PhoneAuthEvent extends PhoneEvent{

   final String codeField;
   final BuildContext context;
   PhoneAuthEvent({required this.codeField, required this.context});

}

class OtpSentEvent extends PhoneEvent{

}
///
// abstract class PhoneEvent {}
//
// class SendOtpEvent extends PhoneEvent {}
//
// class VerifyOtpEvent extends PhoneEvent {
//   final String otp;
//
//   VerifyOtpEvent(this.otp);
// }



