import 'package:flutter/material.dart';
import 'package:office_doc_tracing/screens/dashboard_screen.dart';
import 'package:office_doc_tracing/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<String?>? _getUserToken;

  @override
  void initState() {
    _getUserToken = SharedPreferences.getInstance()
        .then((prefs) => prefs.getString("token"));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getUserToken,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            // The value is not read yet
            return Text("Loading username...");
          }

          final username = snapshot.data.toString();

          return Container(
            child: Text("Hello $username"),
          );
        }
    );
    // Future<bool> isLoggedIn() async {
    //    = await SharedPreferences.getInstance().then((prefs) {
    //     return prefs.getString("token");
    //   }
    //
    //   print("Get tooooken: $token");
    //   if (token != null) {
    //     return true;
    //   }
    //   return false;
    // }


    // Widget build(BuildContext context) {
    //   return FutureBuilder(
    //     future: _getUserToken,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         return Center(
    //           child: Text(
    //             '${snapshot.error} occurred',
    //             style: TextStyle(fontSize: 18),
    //           ),
    //         );
    //       } else if (snapshot.hasData) {
    //         final isLoggedIn = snapshot.data as bool;
    //
    //         if (isLoggedIn == true) {
    //           return const DashboardScreen();
    //         } else {
    //           return const LoginScreen();
    //         }
    //       } else {
    //         return const SizedBox(
    //           width: 60,
    //           height: 60,
    //           child: CircularProgressIndicator(
    //             backgroundColor: Colors.red,
    //           ),
    //         );
    //       }
    //     },
    //   );
    // }
  }
}