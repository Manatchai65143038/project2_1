import 'package:get/get.dart';
import 'package:project2_1/model/todo_model.dart';
import 'package:project2_1/services/storage_service.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs;
  StorageService storageService = StorageService();

  @override
  void onInit() {
    super.onInit();
    fetchTodoList();
    // todoList.value = List<TodoModel>.from(
    //   storageService.read('todoList') ?? [],
    // );
  }

  void fetchTodoList() {
    var todos = storageService.read('todoList');
    if (todos != null) {
      todoList.value = List<TodoModel>.from(
        todos.map((x) => TodoModel.fromJson(x)),
      );
    }
  }

  void addTodo(String title, String subtitle) {
    todoList.add(TodoModel(title, subtitle, false));
    storageService.write('todoList', todoList.toJson());
  }

  void toggletodo(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh();
    storageService.write('todoList', todoList.toJson());
  }

  void deleteTodo(int index) {
    todoList.removeAt(index);
    storageService.write('todoList', todoList.toJson());
  }
}
