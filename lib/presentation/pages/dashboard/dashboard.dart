import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/pages/dashboard/bloc/dashboard_cubit.dart';
import 'package:todo/presentation/pages/dashboard/components/add_task_floating_button.dart';
import 'package:todo/presentation/pages/dashboard/components/header.dart';
import 'package:todo/presentation/pages/dashboard/components/tasks_list.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/utils/helper/helpers.dart';
import 'package:todo/presentation/utils/helper/locator.dart';
import 'package:todo/presentation/widgets/app_search_bar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        if (state is DashboardLoading) {
          LoadingDialog.show(context);
        } else if (state is DashboardError) {
          LoadingDialog.dismiss(context);
          SnackBarMessage.error(context, state.message);
        } else if (state is TaskFetched) {
          LoadingDialog.dismiss(context);
        } else if (state is TaskDeleted) {
          LoadingDialog.dismiss(context);
          SnackBarMessage.success(context, "Task deleted");
        } else if (state is TaskCreated) {
          LoadingDialog.dismiss(context);
          SnackBarMessage.success(context, "Task created");
          Navigator.pop(context);
        } else if (state is TaskUpdated) {
          LoadingDialog.dismiss(context);
          SnackBarMessage.success(context, "Task updated");
          Navigator.pop(context);
        }
      },
      bloc: locator<DashboardCubit>(),
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: const AddTaskFloatingButton(),
          body: SafeArea(
              bottom: false,
              child: Padding(
                padding: AppConstants.paddingH16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppConstants.gap20,
                    const Header(),
                    AppConstants.gap20,
                    AppSearchBar(
                        hint: AppStrings.searchTaskHere,
                        onSearch: locator<DashboardCubit>().searchTask),
                    AppConstants.gap20,
                    TasksList(tasks: locator<DashboardCubit>().tasks)
                  ],
                ),
              )),
        );
      },
    );
  }
}
