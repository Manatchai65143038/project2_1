import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project2_1/views/home_view.dart';
import 'package:project2_1/views/login_view.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    user.bindStream(firebaseAuth.authStateChanges());
  }

  Future<void> register(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("สำเร็จ", "สมัครสมาชิกเสร็จสิ้น");
    } catch (e) {
      Get.snackbar("ล้มเหลว", e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("สำเร็จ", "เข้าสู่ระบบสำเร็จ");
      Get.off(HomeView());
    } catch (e) {
      Get.snackbar("ล้มเหลว", e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
      Get.snackbar("สำเร็จ", "ออกจากระบบสำเร็จ");
      Get.off(LoginView());
    } catch (e) {
      Get.snackbar("ล้มเหลว", e.toString());
    }
  }
}
