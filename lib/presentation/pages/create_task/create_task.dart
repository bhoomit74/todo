import 'package:flutter/material.dart';
import 'package:todo/presentation/pages/dashboard/bloc/dashboard_cubit.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/utils/helper/locator.dart';
import 'package:todo/presentation/widgets/app_button.dart';
import 'package:todo/presentation/widgets/app_text_field.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.padding16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Add Task", style: AppTextStyle.h4()),
          AppConstants.gap20,
          AppTextField(controller: titleController, hint: "Title"),
          AppConstants.gap8,
          AppTextField(controller: descriptionController, hint: "Description"),
          AppConstants.gap32,
          AppButton(
            label: "Add",
            onPressed: () {
              locator<DashboardCubit>().addTask(titleController.text.trim(),
                  descriptionController.text.trim());
            },
          ),
          AppConstants.gap32,
        ],
      ),
    );
  }
}
