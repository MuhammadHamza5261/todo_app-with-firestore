abstract class DeleteDataState{}

class DeleteInitialState extends DeleteDataState{}


class DeleteDataInProgressState extends DeleteDataState{}


class DeleteDataIsLoadedState extends DeleteDataState{}


class DeleteFailure extends DeleteDataState{

  final String errorMessage;
  DeleteFailure(this.errorMessage);

}