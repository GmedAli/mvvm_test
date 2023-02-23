import 'package:todo/app/app.locator.dart';
import 'package:todo/models/task.dart';
import 'package:todo/services/api_service.dart';

class TaskApiService {
  final _api = locator<ApiService>();

  Future<List<TaskDTO>> getTaskList() async {
    try {
      final List<dynamic> data =
          await _api.getApi('/task', version: 1);
      return List.generate(
          data.length, (index) => TaskDTO.fromJson(data[index]));
    } catch (e) {
      rethrow;
    }
  }
}
