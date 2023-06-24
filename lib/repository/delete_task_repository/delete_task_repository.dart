import 'package:http/http.dart';
import 'package:todo_list_app/services/delete_task_service/delete_task_service.dart';

class DeleteTaskRepository{



  DeleteTaskService deleteTaskService = DeleteTaskService();


 Future<Type> deleteTaskRespository({required String id}) async{

   await deleteTaskService.deleteTask(id);

   return Response;






 }




}












