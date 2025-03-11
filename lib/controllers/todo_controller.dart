import 'package:get/get.dart';
import 'package:project2_1/model/todo_model.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs; // รายการงานแบบ Observable

  void addTodo(String title, String subtitle) {
    todoList.add(TodoModel(title: title, subtile: subtitle));
  }

  void toggleTodo(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh(); // อัปเดต UI
  }

  void deleteTodo(int index) {
    todoList.removeAt(index);
  }
}
