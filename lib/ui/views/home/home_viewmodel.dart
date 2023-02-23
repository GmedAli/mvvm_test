import 'package:flutter/foundation.dart';
import 'package:todo/app/app.bottomsheets.dart';
import 'package:todo/app/app.dialogs.dart';
import 'package:todo/app/app.locator.dart';
import 'package:todo/app/app.router.dart';
import 'package:todo/models/task.dart';
import 'package:todo/services/task_service.dart';
import 'package:todo/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel<void> {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _taskService = locator<TaskService>();

  List<TaskDTO> tasks = [];

  Future<List<TaskDTO>> getTaskList() async {
    return await _taskService.getOnlineTaskList();
  }

  void showTaskDetailsDialog(TaskDTO taskDTO) {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: taskDTO.title,
      description: taskDTO.details,
    );
  }

  void navigateToDetails() {
    _navigationService.navigateToTaskDetailsView();
  }

  void navigateToHomeCreateTaskView() {
    _navigationService.navigateToHomeCreateTaskView();
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  @override
  Future<void> futureToRun() async {
    setBusy(true);
    tasks = await getTaskList();
    debugPrint(tasks.length.toString());
    notifyListeners();
    setBusy(false);
  }
}
