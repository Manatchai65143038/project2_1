import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2_1/controllers/todo_controller.dart';

class AddTodoView extends StatelessWidget {
  final TodoController todoController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();

  AddTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('เพิ่มรายการ'), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Todo Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: subtitleController,
                decoration: InputDecoration(
                  labelText: 'Todo subTitle',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty) {
                    todoController.addTodo(
                      titleController.text,
                      subtitleController.text,
                    );

                    Get.back(); // ปิดหน้าต่าง

                    Get.snackbar(
                      'แจ้งเตือน',
                      'บันทึกรายการสำเร็จ',
                      backgroundColor: Colors.green.withOpacity(
                        0.3,
                      ), // สีพื้นหลังของ Snackbar
                      colorText: Colors.black, // สีของข้อความใน Snackbar
                    );

                    // แสดง Snackbar แจ้งเตือนเมื่อข้อมูลไม่ครบ
                  }

                  // แสดง Snackbar แจ้งเตือนเมื่อบันทึกรายการสำเร็จ
                },
                child: Text('บันทึกรายการ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
