abstract class AddEvent{}

class AddScreenEvent extends AddEvent{

  final String contact;
  final String position;

  AddScreenEvent({required this.contact, required this.position});

}

