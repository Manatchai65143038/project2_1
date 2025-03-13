import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2_1/controllers/auth_controller.dart';
import 'package:project2_1/widgets/add_text_field.dart';
import 'package:project2_1/widgets/add_text_field_password.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddTextField(label: 'Email', controller: emailController),
              AppTextFieldPassword(
                label: 'Password',
                controller: passwordController,
              ),
              AppTextFieldPassword(
                label: 'Confirm Password',
                controller: confirmPasswordController,
              ),
              ElevatedButton(
                onPressed: () {
                  if (!GetUtils.isEmail(emailController.text)) {
                    Get.snackbar("Error", "กรุณากรอกอีเมลให้ถูกต้อง");
                  }

                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    Get.snackbar("Error", "รหัสผ่านไม่ตรงกัน");
                  }

                  if (passwordController.text.length < 6) {
                    Get.snackbar("Error", "รหัสผ่านต้องมีอย่างน้อย 6 ตัว");
                  }

                  authController.register(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
