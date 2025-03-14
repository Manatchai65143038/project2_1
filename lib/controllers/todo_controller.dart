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
    fetchTodos();
  }

  /*************  ✨ Codeium Command ⭐  *************/
  /// Fetches todos from Firestore and updates the [todoList] variable.
  ///
  /// If the user is not logged in, this does nothing.
  ///
  /// The [todoList] is updated with the new data from Firestore,
  /// and is marked as changed so that the UI is updated.
  ///
  /******  73116e2a-b984-4555-b080-3d09c30b95f4  *******/
  Future<void> fetchTodos() async {
    var todos = await storageService.read(
      'todoList',
      authController.user.value?.uid ?? '',
    );
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
      uid: authController.user.value?.uid,
    );
    todoList.add(todo);
    storageService.write('todoList', todo.toJson());
  }

  void toggleTodo(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh();
    storageService.write('todoList', todoList.toJson());
  }

  void deleteTodo(int index) {
    todoList.removeAt(index);
    storageService.write('todoList', todoList.toJson());
  }

  void clearTodo() {
    todoList.clear();
  }
}
