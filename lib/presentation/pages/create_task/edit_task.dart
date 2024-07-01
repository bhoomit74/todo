import 'package:flutter/material.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/presentation/pages/dashboard/bloc/dashboard_cubit.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/utils/helper/locator.dart';
import 'package:todo/presentation/widgets/app_button.dart';
import 'package:todo/presentation/widgets/app_text_field.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;
  const EditTaskScreen({super.key, required this.task});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.task.title;
    descriptionController.text = widget.task.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.padding16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Edit Task", style: AppTextStyle.h4()),
          AppConstants.gap32,
          Padding(
            padding: AppConstants.paddingH16,
            child: Text("Title",
                style: AppTextStyle.bodyBold(color: AppColors.primary)),
          ),
          AppConstants.gap4,
          AppTextField(controller: titleController, hint: "Title"),
          AppConstants.gap20,
          Padding(
            padding: AppConstants.paddingH16,
            child: Text("Description",
                style: AppTextStyle.bodyBold(color: AppColors.primary)),
          ),
          AppConstants.gap4,
          AppTextField(controller: descriptionController, hint: "Description"),
          AppConstants.gap32,
          AppButton(
            label: "Update",
            onPressed: () {
              locator<DashboardCubit>().updateTask(widget.task.copyWith(
                  title: titleController.text.trim(),
                  description: descriptionController.text.trim()));
            },
          ),
          AppConstants.gap32,
        ],
      ),
    );
  }
}
