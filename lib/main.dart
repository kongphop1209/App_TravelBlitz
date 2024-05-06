import 'package:flutter/material.dart';
import 'package:traveling_app/screens/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveling_app/auth_page/login_page.dart';
import 'package:traveling_app/auth_page/register_page.dart';
import 'package:traveling_app/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCiI-z8MKrBoiPYFf7Ni2n3fhqD0JG9Tcg",
        appId: '1:125918499055:android:571c7ae40350e624aa4b1a',
        messagingSenderId: '125918499055',
        projectId: 'base-ddced'),
  );
  try {
    await FirebaseAppCheck.instance.activate();
  } catch (e) {
    print('Error activating Firebase App Check: $e');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, _) => MaterialApp(
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginPage(),
          '/main': (context) => const MainPage(),
          '/home': (context) => const HomePage(),
          '/register': (context) => const RegisterPage(),
        },
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
      designSize: const Size(360, 690),
    );
  }
}
