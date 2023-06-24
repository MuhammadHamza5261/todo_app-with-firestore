



import '../../models/response.dart';
import '../../services/update_task_service/update_task_service.dart';

class UpdateTaskRepository{

  UpdateTaskService updateTaskService = UpdateTaskService();

  Future<Response?>  updatetaskRepository({required String position, required String contactno, required String docId}) async{

  Response? response = await  updateTaskService.updateTask(position, contactno,docId);
  
  return response;



  }








}