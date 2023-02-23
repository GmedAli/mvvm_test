import 'package:todo/services/api/task_api_service.dart';
import 'package:todo/services/localdb_service.dart';
import 'package:todo/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:todo/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:todo/ui/views/home/home_create_task/home_create_task_view.dart';
import 'package:todo/ui/views/home/home_view.dart';
import 'package:todo/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo/ui/views/home/task_details/task_details_view.dart';
import 'package:todo/services/api_service.dart';
import 'package:todo/services/task_service.dart';

// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: TaskDetailsView),
    MaterialRoute(page: HomeCreateTaskView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LocaldbService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: TaskService),
    LazySingleton(classType: TaskApiService),

// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
