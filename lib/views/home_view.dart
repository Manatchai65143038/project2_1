import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2_1/controllers/todo_controller.dart';
import 'package:project2_1/model/todo_model.dart';
import 'package:project2_1/views/add_todo_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home View',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(() {
          return todoController.todoList.isEmpty
              ? Center(
                child: Text(
                  'ไม่มีรายการสิ่งที่ต้องทำ',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
              : ListView.builder(
                itemCount: todoController.todoList.length,
                itemBuilder: (context, index) {
                  TodoModel todo = todoController.todoList[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 4,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration:
                              todo.isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      subtitle: Text(todo.subtile),
                      leading: Checkbox(
                        value: todo.isDone,
                        activeColor: Colors.green,
                        onChanged: (bool? newValue) {
                          todoController.toggleTodo(index);
                        },
                      ),
                      trailing: IconButton(
                        onPressed: () => todoController.deleteTodo(index),
                        icon: Icon(Icons.delete, color: Colors.red.shade700),
                      ),
                    ),
                  );
                },
              );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(AddTodoView()),
        backgroundColor: Colors.green.shade700,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
