import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.navigateToHomeCreateTaskView(),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Tasks List',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 26,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  itemCount: viewModel.tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: ()=> viewModel.showTaskDetailsDialog(viewModel.tasks.elementAt(index)),
                      subtitle: Text(viewModel.tasks[index].details??''),
                      title: Text(viewModel.tasks[index].title??''),
                      leading: const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
