abstract class PhoneEvent{}

class PhoneAuthEvent extends PhoneEvent{

   final String codeField;
   PhoneAuthEvent({required this.codeField});

}



