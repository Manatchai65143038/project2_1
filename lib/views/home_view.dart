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
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: todoController.todoList.length,
                  itemBuilder: (context, index) {
                    TodoModel todo = todoController.todoList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Card(
                        elevation: 4, // ให้เงาสำหรับการตกแต่ง
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // มุมโค้งมน
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ), // ขอบกรอบ
                            color: Colors.white, // พื้นหลังสีขาว
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              todo.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              todo.subtitle,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            leading: Checkbox(
                              value: todo.isDone,
                              onChanged: (bool? newValue) {
                                todoController.toggletodo(index);
                              },
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                todoController.deleteTodo(index);
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
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
