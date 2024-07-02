part of 'dashboard_cubit.dart';

sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardLoading extends DashboardState {}

final class TaskFetched extends DashboardState {}

final class TaskDeleted extends DashboardState {}

final class TaskCreated extends DashboardState {}

final class TaskUpdated extends DashboardState {}

final class TaskFiltered extends DashboardState {}

final class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}
