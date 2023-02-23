import 'package:todo/app/app.locator.dart';
import 'package:todo/models/task.dart';
import 'package:todo/services/api/task_api_service.dart';
import 'package:todo/services/localdb_service.dart';

class TaskService {
  final _taskApiService = locator<TaskApiService>();
  final _localdbService = locator<LocaldbService>();

  Future<List<TaskDTO>> getLocalTaskList() async =>
      await _localdbService.getTaskList();

  Future<List<TaskDTO>> getOnlineTaskList() async =>
      await _taskApiService.getTaskList();
}
