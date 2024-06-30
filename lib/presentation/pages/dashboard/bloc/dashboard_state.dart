part of 'dashboard_cubit.dart';

sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardLoading extends DashboardState {}

final class DashboardSuccess extends DashboardState {}

final class TaskDeleted extends DashboardState {}

final class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}
