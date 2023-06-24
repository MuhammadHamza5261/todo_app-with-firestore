abstract class GoogleScreenState{}


class GoogleInitialState extends GoogleScreenState{}


class GoogleInProgressState extends GoogleScreenState{}


class GoogleDataIsLoadedState extends GoogleScreenState{}



class GoogleIsFailure extends GoogleScreenState{

  final String errorMessage;
  GoogleIsFailure(this.errorMessage);

}