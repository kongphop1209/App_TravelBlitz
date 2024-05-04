import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveling_app/auth_page/login_page.dart';
import 'package:traveling_app/main_page.dart';
import 'package:traveling_app/services/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:traveling_app/widget/container_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/background_register.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            ContainerWidget(
                              controller: _emailController,
                              hintText: 'Email',
                              isPasswordField: false,
                            ),
                            SizedBox(height: 15.h),
                            ContainerWidget(
                              controller: _usernameController,
                              hintText: 'Username',
                              isPasswordField: false,
                            ),
                            SizedBox(height: 15.h),
                            ContainerWidget(
                              controller: _passwordController,
                              hintText: 'Password',
                              isPasswordField: true,
                            ),
                            SizedBox(height: 10.h),
                            GestureDetector(
                              onTap: _signUp,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.w),
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                alignment: Alignment.center,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 114, 114, 114)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return const LoginPage();
                                        },
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin = Offset(-1.0, 0.0);
                                          const end = Offset.zero;
                                          const curve = Curves.easeInOut;

                                          var tween =
                                              Tween(begin: begin, end: end)
                                                  .chain(
                                            CurveTween(curve: curve),
                                          );

                                          return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Validate email format
    if (!_isEmailValid(email)) {
      // Show an error message to the user indicating that the email address is invalid
      print("Invalid email address");
      return;
    }

    // Sign up with email and password
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If sign-up is successful, print a success message and navigate to the home screen
      if (userCredential.user != null) {
        print("User is successfully created");
        Navigator.pushNamed(context, "/home");
      }
    } catch (e) {
      // If an error occurs during sign-up, print the error message
      print("Error occurred during sign-up: $e");
      // You can also provide more specific error messages based on the error code
      // For example, if the error code is 'email-already-in-use', you can show a message like:
      // if (e.code == 'email-already-in-use') {
      //   print('The account already exists for that email.');
      // }
    }
  }

// Email validation function
  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
