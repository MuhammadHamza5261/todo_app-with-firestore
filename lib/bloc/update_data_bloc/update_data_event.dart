abstract class UpdateEvent{}

class UpdateScreenEvent extends UpdateEvent{

  final String position;
  final String contactno;
  final String DocUid;


  UpdateScreenEvent({required this.position, required this.contactno,required this.DocUid});


}