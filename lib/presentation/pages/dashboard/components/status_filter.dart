import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/enums/status.dart';
import 'package:todo/presentation/pages/dashboard/bloc/dashboard_cubit.dart';
import 'package:todo/presentation/styles/styles.dart';
import 'package:todo/presentation/utils/helper/locator.dart';
import 'package:todo/presentation/widgets/app_chip.dart';

class StatusFilter extends StatelessWidget {
  const StatusFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      bloc: locator<DashboardCubit>(),
      buildWhen: (previous, current) => current is TaskFiltered,
      builder: (context, state) {
        return Padding(
          padding: AppConstants.paddingV16,
          child: SizedBox(
            height: 48,
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: AppChip(
                      label: "All",
                      onPressed: () => locator<DashboardCubit>().filterTask(),
                      isSelected: locator<DashboardCubit>().filter == null,
                    ),
                  ),
                  ...Status.values.map((status) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: AppChip(
                            label: status.name,
                            onPressed: () => locator<DashboardCubit>()
                                .filterTask(status: status),
                            isSelected:
                                status == locator<DashboardCubit>().filter),
                      )),
                ]),
          ),
        );
      },
    );
  }
}
