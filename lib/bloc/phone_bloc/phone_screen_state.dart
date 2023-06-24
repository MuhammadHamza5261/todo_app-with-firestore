abstract class PhoneScreenState{}


class InitialState extends PhoneScreenState{}


class PhoneInProgressState extends PhoneScreenState{}



class PhoneDataIsLoadedState extends PhoneScreenState{}


class PhoneIsFailure extends PhoneScreenState{

  final String errorMessage;
  PhoneIsFailure(this.errorMessage);

}


