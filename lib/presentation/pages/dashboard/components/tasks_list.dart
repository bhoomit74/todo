import 'package:flutter/material.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/presentation/pages/dashboard/components/task_tile.dart';
import 'package:todo/presentation/styles/styles.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  const TasksList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tasks", style: AppTextStyle.h4()),
          AppConstants.gap8,
          tasks.isNotEmpty
              ? Flexible(
                  child: ListView.separated(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) =>
                        TaskTile(task: tasks[index]),
                    separatorBuilder: (context, index) => AppConstants.gap8,
                  ),
                )
              : Expanded(
                  child: Center(
                    child: Text(AppStrings.taskNotFound,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.body(color: AppColors.black70)),
                  ),
                )
        ],
      ),
    );
  }
}
