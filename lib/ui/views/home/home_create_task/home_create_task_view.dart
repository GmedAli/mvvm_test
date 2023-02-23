import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_create_task_viewmodel.dart';

class HomeCreateTaskView extends StackedView<HomeCreateTaskViewModel> {
  const HomeCreateTaskView({Key? key}) : super(key: key);
  @override
  void onViewModelReady(HomeCreateTaskViewModel viewModel) {}

  @override
  Widget builder(
    BuildContext context,
    HomeCreateTaskViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Create Task',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 26,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) => viewModel.updateTaskName(value),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "title",
                          fillColor: Colors.white70),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (value) => viewModel.updateTDetails(value),
                      minLines: 3,
                      maxLines: 6,
                      maxLength: 254,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: false,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "details",
                          fillColor: Colors.white70),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            viewModel.updateDueTdate(await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1980),
                                lastDate: DateTime(2077)));
                          },
                          child: Text('due Date:   ${viewModel.dueDate}'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => viewModel.onSubmit(),
                      child: Center(
                        child: Text('Submit'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeCreateTaskViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeCreateTaskViewModel();
}
