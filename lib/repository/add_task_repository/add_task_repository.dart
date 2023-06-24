import '../../models/response.dart';
import '../../services/add_task_service/add_task_service.dart';

class AddTaskRepository{

  AddTaskService addTaskService = AddTaskService();

  Future<Response?>  addtaskRespository({required String postion, required String contactNo}) async{
    Response? response = await  addTaskService.addTask(postion,contactNo);

    return  response;

  }
}