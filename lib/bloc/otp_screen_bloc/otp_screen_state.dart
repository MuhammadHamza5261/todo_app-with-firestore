abstract class OtpScreenState{}

class OtpInitialState extends OtpScreenState{}

class OtpInProgressState extends OtpScreenState{}

class OtpDataIsLoadedState extends OtpScreenState{}


class OtpVerifiedState extends OtpScreenState{}



class OtpIsFailure extends OtpScreenState{

  final String errorMessage;
  OtpIsFailure(this.errorMessage);


}