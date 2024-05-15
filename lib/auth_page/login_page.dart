import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:traveling_app/auth_page/forgetpassword_1.dart';
import 'package:traveling_app/auth_page/register_page.dart';
import 'package:traveling_app/main_page.dart';
import 'package:traveling_app/screens/terms.dart';
import 'package:traveling_app/services/firebase_auth/firebase_auth_services.dart';
import 'package:traveling_app/widget/container_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSigningUp = false;
  bool _rememberMeChecked = false;
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

  String? _emailError;
  String? _passwordError;

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
                      'assets/images/background_login.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
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
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.08),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    _emailError ?? '',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            ContainerWidget(
                              controller: _passwordController,
                              hintText: 'Password',
                              isPasswordField: true,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.08),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    _passwordError ?? '',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.010,
                            ),
                            GestureDetector(
                              onTap: _login,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.w),
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: isSigningUp
                                    ? CupertinoActivityIndicator(
                                        animating: true,
                                        radius: 15.0,
                                        color: Colors.white,
                                      )
                                    : Text(
                                        textAlign: TextAlign.center,
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ForgetPassword(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Forget Password',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.blue,
                                        value: _rememberMeChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            _rememberMeChecked = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Remember Me',
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                255, 78, 78, 78)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have account?",
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
                                          return const RegisterPage();
                                        },
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin = Offset(1.0, 0.0);
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
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TermsOfUses(),
                                  ),
                                );
                              },
                              child: Text(
                                'Terms of use',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue.shade800),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
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

  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    _emailError = null;
    _passwordError = null;

    if (!_isEmailValid(email)) {
      setState(() {
        _emailError = 'Invalid email address';
      });
      return;
    }

    if (!_isPasswordValid(password)) {
      setState(() {
        _passwordError = 'Invalid password';
      });
      return;
    }

    try {
      setState(() {
        isSigningUp = true;
      });

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        print("User is successfully signed in");
        Navigator.pushNamed(context, "/main");
      }

      setState(() {
        isSigningUp = false;
      });
    } catch (e) {
      print("Error occurred during sign-in: $e");

      setState(() {
        isSigningUp = false;
      });

      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            setState(() {
              _emailError = 'User not found';
            });
            break;
          case 'wrong-password':
            setState(() {
              _passwordError = 'Wrong password';
            });
            break;
          default:
            setState(() {
              _emailError = 'An error occurred';
            });
        }
      }
    }
  }

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final englishRegex = RegExp(r'^[a-zA-Z0-9@.]+$');
    return emailRegex.hasMatch(email) && englishRegex.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    final englishRegex = RegExp(r'^[a-zA-Z0-9]+$');
    return password.length >= 6 && englishRegex.hasMatch(password);
  }
}
