import 'package:get/get.dart';
import 'package:project2_1/controllers/auth_controller.dart';
import 'package:project2_1/model/todo_model.dart';
import 'package:project2_1/services/storage_service.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs;
  StorageService storageService = StorageService();
  AuthController authController = Get.put(AuthController());

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
    TodoModel todo = TodoModel(
      title,
      subtitle,
      false,
      uid: authController.user.value!.uid,
    );
    todoList.add(todo);
    storageService.write('todoList', todo.toJson());
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
