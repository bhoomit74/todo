import 'package:flutter/material.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/enums/status.dart';
import 'package:todo/presentation/pages/dashboard/bloc/dashboard_cubit.dart';
import 'package:todo/presentation/styles/app_constants.dart';
import 'package:todo/presentation/utils/helper/locator.dart';
import 'package:todo/presentation/widgets/app_chip.dart';

class UpdateStatus extends StatelessWidget {
  final Task task;
  const UpdateStatus({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppConstants.paddingV16,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: Status.values
                .map((status) => AppChip(
                    label: status.name,
                    onPressed: () => locator<DashboardCubit>()
                        .updateTask(task.copyWith(status: status)),
                    isSelected: status == task.status))
                .toList()),
      ),
    );
  }
}
