import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/pages/create_task/create_task.dart';
import 'package:todo/presentation/pages/dashboard/bloc/dashboard_cubit.dart';
import 'package:todo/presentation/pages/dashboard/components/header.dart';
import 'package:todo/presentation/pages/dashboard/components/tasks_list.dart';
import 'package:todo/presentation/styles/app_colors.dart';
import 'package:todo/presentation/styles/app_constants.dart';
import 'package:todo/presentation/styles/app_strings.dart';
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
        } else if (state is DashboardSuccess) {
          LoadingDialog.dismiss(context);
        } else if (state is TaskDeleted) {
          LoadingDialog.dismiss(context);
          SnackBarMessage.success(context, "Task is deleted");
        } else if (state is TaskCreated) {
          LoadingDialog.dismiss(context);
          SnackBarMessage.success(context, "Task created");
          Navigator.pop(context);
        }
      },
      bloc: locator<DashboardCubit>(),
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primary,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                enableDrag: true,
                isScrollControlled: true,
                useRootNavigator: true,
                useSafeArea: true,
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: AppConstants.borderRadius16),
                builder: (context) => const CreateTaskScreen(),
              );
            },
            tooltip: "Add new task",
            child: const Icon(Icons.add, color: AppColors.white),
          ),
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
                        onSearch: (query) {
                          //TODO: Perform search
                        }),
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
