import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/usecases/task/add_task_usecase.dart';
import 'package:todo/domain/usecases/task/delete_task_usecase.dart';
import 'package:todo/domain/usecases/task/fetch_task_usecase.dart';
import 'package:todo/presentation/utils/helper/locator.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  List<Task> tasks = [];
  DashboardCubit() : super(DashboardInitial()) {
    fetchTasks();
  }

  fetchTasks() async {
    emit(DashboardLoading());
    try {
      tasks = await locator<FetchTaskUsecase>().call();
      emit(DashboardSuccess());
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }

  addTask() async {
    emit(DashboardLoading());
    try {
      tasks = await locator<AddTaskUsecase>().call(Task.create(
          title: "Title ${DateTime.now().second}",
          description: "Description ${DateTime.now().millisecondsSinceEpoch}"));
      emit(DashboardSuccess());
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }

  deleteTask(Task task) async {
    emit(DashboardLoading());
    try {
      await locator<DeleteTaskUsecase>().call(task);
      tasks.remove(task);
      emit(TaskDeleted());
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }
}
