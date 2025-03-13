import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2_1/controllers/auth_controller.dart';
import 'package:project2_1/views/register_view.dart';
import 'package:project2_1/widgets/add_text_field.dart';
import 'package:project2_1/widgets/add_text_field_password.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login')),
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

              ElevatedButton(
                onPressed: () {
                  if (!GetUtils.isEmail(emailController.text)) {
                    Get.snackbar("Error", "กรุณากรอกอีเมลให้ถูกต้อง");
                  }

                  if (passwordController.text.length < 6) {
                    Get.snackbar("Error", "รหัสผ่านต้องมีอย่างน้อย 6 ตัว");
                  }
                  authController.login(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Text('Login'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Get.to(RegisterView());
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
