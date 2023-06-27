abstract class ToDoState{}

class ToDoInitial extends ToDoState{}

class ToDoInProgressState extends ToDoState{}


class ToDoDataIsLoadedState extends ToDoState{}


class ToDoFailure extends ToDoState{

  final String errorMessage;
   ToDoFailure(this.errorMessage);
}






