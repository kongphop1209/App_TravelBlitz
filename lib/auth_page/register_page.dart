import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveling_app/auth_page/login_page.dart';
import 'package:traveling_app/main_page.dart';
import 'package:traveling_app/screens/terms.dart';
import 'package:traveling_app/services/firebase_auth/firebase_auth_services.dart';
import 'package:traveling_app/widget/container_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  Future<void> _createUserProfile(
      String userId, String username, String email) async {
    try {
      // Reference to the 'users' collection in Firebase Firestore
      CollectionReference usersRef =
          FirebaseFirestore.instance.collection('users');

      // Create or update a document with userId as document ID
      await usersRef.doc(userId).set({
        'username': username,
        'email': email,
        'password': ''
        // Add additional fields as needed
      });

      print('User profile created in Firestore');
    } catch (e) {
      print("Error creating user profile: $e");
    }
  }

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _emailError;
  String? _passwordError;
  String? _usernameError;

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
                    height: MediaQuery.of(context).size.height * 0.03,
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
                              controller: _usernameController,
                              hintText: 'Username',
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
                                  Expanded(
                                    child: Text(
                                      _usernameError ?? '',
                                      style: TextStyle(color: Colors.red),
                                    ),
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
                                      MediaQuery.of(context).size.width * 0.05),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      _passwordError ?? '',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            GestureDetector(
                              onTap: isSigningUp ? null : _register,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.w),
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                alignment: Alignment.center,
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
                                        'Register',
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

  void _register() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Reset error messages
    setState(() {
      _emailError = null;
      _usernameError = null;
      _passwordError = null;
    });

    if (!_isEmailValid(email)) {
      setState(() {
        _emailError = 'Invalid email address';
      });
      return;
    }

    if (!_isUsernameValid(username)) {
      setState(() {
        _usernameError = 'Username must be between 1 and 16 characters';
      });
      return;
    }

    if (!_isPasswordValid(password)) {
      setState(() {
        _passwordError =
            'Password must have at least 1 uppercase letter, 4 digits, and be at least 8 characters long';
      });
      return;
    }

    setState(() {
      isSigningUp = true;
    });

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        print("User is successfully Created");
        await _createUserProfile(userCredential.user!.uid, username, email);
        Navigator.pushNamed(context, "/main");
      }

      // Set loading state to false after registration process completes
      setState(() {
        isSigningUp = false;
      });
    } catch (e) {
      print("Error occurred during sign-up: $e");
      // Set loading state to false in case of error
      setState(() {
        isSigningUp = false;
      });
    }
  }

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool _isUsernameValid(String username) {
    // Username should be between 1 and 16 characters
    return username.length >= 1 && username.length <= 16;
  }

  bool _isPasswordValid(String password) {
    // Password should have at least 8 characters, including 1 uppercase letter and 4 digits
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d{4}).{8,}$');
    return passwordRegex.hasMatch(password);
  }
}
