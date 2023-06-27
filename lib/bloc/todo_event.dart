abstract class Event{}

class ToDoEvent extends Event{

  final String email;
  final String password;

  ToDoEvent({required this.email, required this.password});

}






