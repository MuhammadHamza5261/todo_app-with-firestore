abstract class OtpEvent{}

class OtpScreenEvent extends OtpEvent{

  final String  verify;
  final String  code;

  OtpScreenEvent({required this.code,required this.verify});

}


class OtpDone extends OtpEvent{}

