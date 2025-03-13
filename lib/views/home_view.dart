import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2_1/controllers/auth_controller.dart';
import 'package:project2_1/controllers/todo_controller.dart';
import 'package:project2_1/model/todo_model.dart';
import 'package:project2_1/views/add_todo_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  TodoController todoController = Get.put(TodoController());
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    todoController.fetchTodos();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home View',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 185, 16, 67),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              todoController.clearTodo();
              authController.logout();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Todo List',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: todoController.todoList.length,
                  itemBuilder: (context, index) {
                    TodoModel todo = todoController.todoList[index];
                    return Card(
                      margin: const EdgeInsets.only(top: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration:
                                todo.isDone ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        subtitle:
                            todo.subtitle.isEmpty ? null : Text(todo.subtitle),
                        leading: Checkbox(
                          value: todo.isDone,
                          onChanged: (bool? newValue) {
                            todoController.toggleTodo(index);
                          },
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            todoController.deleteTodo(index);
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTodoView());
        },
        child: const Icon(Icons.add, size: 30),
        backgroundColor: const Color.fromARGB(255, 247, 10, 247),
        elevation: 0,
      ),
    );
  }
}
