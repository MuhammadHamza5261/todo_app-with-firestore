abstract class AddScreenState{}

class AddInitialState extends AddScreenState{}


class AddInProgressState extends AddScreenState{}


class AddDataIsLoadedState extends AddScreenState{}


class AddFailure extends AddScreenState{

  final String errorMessage;
  AddFailure(this.errorMessage);

}