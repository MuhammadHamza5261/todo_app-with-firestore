abstract class DeleteEvent{}

class DeleteDataEvent extends DeleteEvent{

  final String id;
  DeleteDataEvent({required this.id});


}