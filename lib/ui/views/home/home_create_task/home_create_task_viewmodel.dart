import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo/app/app.locator.dart';
import 'package:todo/app/app.router.dart';
import 'package:todo/models/task.dart';
import 'package:todo/services/localdb_service.dart';

class HomeCreateTaskViewModel extends BaseViewModel {
  final _localDBService = locator<LocaldbService>();
  final _navigationService = locator<NavigationService>();

  String taskName = '';
  String details = '';
  DateTime? dueDate;

  void updateTaskName(String value) => taskName = value;
  void updateTDetails(String value) => details = value;
  void updateDueTdate(DateTime? value) => {dueDate = value, rebuildUi()};

  Future<void> onSubmit() async {
    TaskDTO task = TaskDTO(
      createdAt: DateTime.now().toString(),
      title: taskName,
      dueDate: dueDate.toString(),
      details: details,
    );
    debugPrint(task.toJson().toString());
    await _localDBService.insertTask(task);

    _navigationService.navigateToHomeView();
  }
}
