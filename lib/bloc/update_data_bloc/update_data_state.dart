abstract  class UpdateDataState{}


class UpdateInitialState extends UpdateDataState{}


class UpdateInProgressState extends UpdateDataState{}


class UpdateDataIsLoadedState extends UpdateDataState{}


class UpdateFailure extends UpdateDataState{

  final String errorMessage;
  UpdateFailure(this.errorMessage);

}