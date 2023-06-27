import '../../models/response.dart';
import '../../services/add_task_service/add_task_service.dart';

class AddTaskRepository{

  //firstly use the service class

  AddTaskService addTaskService = AddTaskService();

  Future<Response?>  addtaskRespository({required String position, required String contactNo}) async{
    Response? response = await  addTaskService.addTask(position,contactNo);

    return  response;

  }
}