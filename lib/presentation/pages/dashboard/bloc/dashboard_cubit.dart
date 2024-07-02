import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/enums/status.dart';
import 'package:todo/domain/usecases/task/add_task_usecase.dart';
import 'package:todo/domain/usecases/task/delete_task_usecase.dart';
import 'package:todo/domain/usecases/task/fetch_task_usecase.dart';
import 'package:todo/presentation/utils/helper/locator.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  List<Task> _tasks = [];
  List<Task> tasks = [];
  Status? filter;
  DashboardCubit() : super(DashboardInitial()) {
    fetchTasks();
  }

  fetchTasks() async {
    //add delay to build widget
    await Future.delayed(Duration.zero);
    emit(DashboardLoading());
    try {
      _tasks = await locator<FetchTaskUsecase>().call();
      filterTask(status: filter);
      emit(TaskFetched());
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }

  addTask(String title, String description) async {
    emit(DashboardLoading());
    try {
      Task task = Task.create(title: title, description: description);
      _tasks = await locator<AddTaskUsecase>().call(task);
      filterTask(status: filter);
      emit(TaskCreated());
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }

  updateTask(Task task) async {
    emit(DashboardLoading());
    try {
      _tasks = await locator<AddTaskUsecase>().call(task);
      filterTask(status: filter);
      emit(TaskUpdated());
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }

  deleteTask(Task task) async {
    emit(DashboardLoading());
    try {
      await locator<DeleteTaskUsecase>().call(task);
      _tasks.remove(task);
      filterTask(status: filter);
      emit(TaskDeleted());
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }

  filterTask({Status? status}) {
    filter = status;
    if (status == null) {
      tasks = _tasks;
    } else {
      tasks = _tasks.where((task) => task.status == status).toList();
    }
    emit(TaskFiltered());
  }

  searchTask(String query) {
    if (query.isEmpty) {
      //Show all task;
      filterTask(status: filter);
      emit(TaskFetched());
      return;
    }
    tasks = tasks
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()) ||
            element.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(TaskFetched());
  }
}
