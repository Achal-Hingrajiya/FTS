import 'package:flutter/material.dart';
import 'package:office_doc_tracing/screens/create_branch.dart';
import 'package:office_doc_tracing/screens/dashboard_screen.dart';
import 'package:office_doc_tracing/screens/home_screen.dart';
import 'package:office_doc_tracing/screens/login_screen.dart';
import 'package:office_doc_tracing/screens/create_user_screen.dart';
import 'package:office_doc_tracing/screens/update_user_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CreateBranchScreen(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const LoginScreen(),
      //   '/login': (context) => const LoginScreen(),
      //   '/create_user': (context) => const CreateUserScreen(),
      //   '/dashboard' : (context) => const DashboardScreen(),
      //   '/update_user' : (context) => const UpdateUserScreen(),
      //
      // },
    );
  }
}
