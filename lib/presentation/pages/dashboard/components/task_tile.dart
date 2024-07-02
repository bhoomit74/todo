import 'package:flutter/material.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/presentation/pages/dashboard/bloc/dashboard_cubit.dart';
import 'package:todo/presentation/pages/dashboard/components/date_view.dart';
import 'package:todo/presentation/pages/tasks/edit_task.dart';
import 'package:todo/presentation/pages/tasks/update_task_status.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/utils/helper/locator.dart';
import 'package:todo/presentation/utils/helper/show_app_bottom_sheet.dart';
import 'package:todo/presentation/widgets/app_label.dart';
import 'package:todo/presentation/widgets/dismissible_tile.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppConstants.borderRadius16,
      child: DismissibleTile(
        onDelete: () => locator<DashboardCubit>().deleteTask(task),
        child: Container(
          padding: AppConstants.padding16,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.black70, AppColors.black])),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: AppTextStyle.bodyBold(color: AppColors.white),
              ),
              AppConstants.gap4,
              Text(
                task.description,
                style: AppTextStyle.caption(color: AppColors.grey),
              ),
              AppConstants.gap20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DateView(date: task.date),
                  Row(
                    children: [
                      AppLabel(
                        label: "Edit",
                        bgColor: AppColors.white,
                        textColor: AppColors.black70,
                        onPressed: () => showAppBottomSheet(
                            context: context,
                            widget: EditTaskScreen(task: task)),
                      ),
                      AppConstants.gap4,
                      GestureDetector(
                        onTap: () => showAppBottomSheet(
                            context: context,
                            widget: UpdateTaskStatus(task: task)),
                        child: AppLabel(
                          label: task.status.name,
                          bgColor: AppColors.green,
                          textColor: AppColors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
