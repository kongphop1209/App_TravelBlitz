import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveling_app/auth_page/login_page.dart';
import 'package:traveling_app/main_page.dart';
import 'package:traveling_app/widget/container_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      resizeToAvoidBottomInset: false,
      body: Stack(
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
                            hintText: 'Email or Username',
                            isPasswordField: false,
                          ),
                          SizedBox(height: 15.h),
                          ContainerWidget(
                            hintText: 'Password',
                            isPasswordField: false,
                          ),
                          SizedBox(height: 15.h),
                          ContainerWidget(
                            hintText: 'Confirm Password',
                            isPasswordField: false,
                          ),
                          SizedBox(height: 10.h),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainPage(),
                                ),
                              );
                            },
                            child: Container(
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
                                    color: Color.fromARGB(255, 114, 114, 114)),
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
                                            Tween(begin: begin, end: end).chain(
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
    );
  }
}
