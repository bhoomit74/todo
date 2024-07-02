import 'package:flutter/material.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/enums/status.dart';
import 'package:todo/presentation/pages/dashboard/bloc/dashboard_cubit.dart';
import 'package:todo/presentation/pages/dashboard/components/task_tile.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/utils/helper/locator.dart';
import 'package:todo/presentation/widgets/app_chip.dart';

class UpdateTaskStatus extends StatelessWidget {
  final Task task;
  const UpdateTaskStatus({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppConstants.padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Update task status", style: AppTextStyle.h4()),
            AppConstants.gap32,
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: Status.values
                    .map((status) => AppChip(
                        label: status.name,
                        onPressed: () => locator<DashboardCubit>()
                            .updateTask(task.copyWith(status: status)),
                        isSelected: status == task.status))
                    .toList()),
            AppConstants.gap32,
            IgnorePointer(
              child: TaskTile(task: task),
            ),
          ],
        ),
      ),
    );
  }
}
