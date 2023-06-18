import 'package:mens_app/controllers/login_controller.dart';
import 'package:mens_app/screens/home.dart';
import 'package:mens_app/screens/auth/widgets/input_fields.dart';
import 'package:mens_app/screens/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mens_app/controllers/registeration_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  RegistertionController registerationController =
      Get.put(RegistertionController());

  LoginController loginController = Get.put(LoginController());

  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Center(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text(
                          'WELCOME GIRL',
                          style: GoogleFonts.montserrat(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFF6D6D)),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                          width: 200,
                          height: 200,
                          child: Lottie.network(
                              'https://assets1.lottiefiles.com/packages/lf20_5zgaphlt.json')),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        color:
                            !isLogin.value ? Color(0xffF7C6C6) : Colors.white,
                        onPressed: () {
                          isLogin.value = false;
                        },
                        child: Text(
                          'Register',
                          style: GoogleFonts.montserrat(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MaterialButton(
                        color: isLogin.value ? Color(0xffF7C6C6) : Colors.white,
                        onPressed: () {
                          isLogin.value = true;
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.montserrat(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  isLogin.value ? loginWidget() : registerWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        InputTextFieldWidget(
            registerationController.nameController, 'Your Name'),
        SizedBox(
          height: 15,
        ),
        InputTextFieldWidget(registerationController.emailController,
            'Email Address : xxx@gmail.com'),
        SizedBox(
          height: 15,
        ),
        InputTextFieldWidget(registerationController.passwordController,
            'Password : ex (1234567)'),
        SizedBox(
          height: 15,
        ),
        TombolSubmit(
          onPressed: () => registerationController.registerWithEmail(),
          title: 'Register',
        )
      ],
    );
  }

  Widget loginWidget() {
    return Column(
      children: [
        InputTextFieldWidget(loginController.emailController, 'Email Address'),
        SizedBox(
          height: 15,
        ),
        InputTextFieldWidget(loginController.passwordController, 'Password'),
        SizedBox(
          height: 15,
        ),
        TombolSubmit(
            onPressed: () => loginController.loginWithEmail(), title: 'Login')
      ],
    );
  }
}
