import 'package:flutter/material.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/widgets/app_label.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppConstants.padding16,
      decoration: BoxDecoration(
          borderRadius: AppConstants.borderRadius16,
          gradient: const LinearGradient(
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
              Row(
                children: [
                  const Icon(Icons.calendar_month_rounded,
                      color: AppColors.grey, size: 24),
                  AppConstants.gap4,
                  Text(
                    task.date,
                    style: AppTextStyle.caption(color: AppColors.grey),
                  )
                ],
              ),
              AppLabel(
                label: task.status,
                bgColor: AppColors.green,
                textColor: AppColors.white,
              )
            ],
          ),
        ],
      ),
    );
  }
}
