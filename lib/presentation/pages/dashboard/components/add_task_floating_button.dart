import 'package:flutter/material.dart';
import 'package:todo/presentation/pages/tasks/create_task.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/utils/helper/show_app_bottom_sheet.dart';

class AddTaskFloatingButton extends StatelessWidget {
  const AddTaskFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primary,
      onPressed: () {
        showAppBottomSheet(context: context, widget: const CreateTaskScreen());
      },
      tooltip: "Add new task",
      child: const Icon(Icons.add, color: AppColors.white),
    );
  }
}
