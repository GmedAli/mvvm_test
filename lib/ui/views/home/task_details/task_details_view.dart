import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'task_details_viewmodel.dart';

class TaskDetailsView extends StackedView<TaskDetailsViewModel> {
  const TaskDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TaskDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  TaskDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TaskDetailsViewModel();
}
