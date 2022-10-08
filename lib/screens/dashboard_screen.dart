import 'package:flutter/material.dart';
import 'package:office_doc_tracing/constants.dart';
import 'package:office_doc_tracing/screens/create_user_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? token;

  fetchTokenFromPref() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    token = _prefs.getString("token");

    print("Get tooooken: $token");
  }

  @override
  void initState() {
    fetchTokenFromPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var section1_width = width * 0.3265625;
    var pading_around_form_desktop = EdgeInsets.fromLTRB(
      width * 0.1015625,
      height * 0.25277,
      width * 0.10703,
      height * 0.25277,
    );
    var pading_around_form_mobile = EdgeInsets.fromLTRB(
      width * 0.1015625,
      height * 0.22462,
      width * 0.10703,
      height * 0.10321,
    );

    print("heiiiight: $height");
    print("wiiiiidth: $width");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: black,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => CreateUserScreen(),
                  ),
                );
              },
              child: Text(
                "Create new user",
              ),
            ),
          ],
        ),
      ),
      body: width > 1000
          ? _buildDesktopDashboardScreen(
              height,
              section1_width,
              pading_around_form_desktop,
              context,
            )
          : _buildDesktopDashboardScreen(
              height,
              section1_width,
              pading_around_form_desktop,
              context,
            ),
    );
  }

  Row _buildDesktopDashboardScreen(
    double height,
    double section1_width,
    EdgeInsets pading_around_form,
    BuildContext context,
  ) {
    return Row(
      children: [
        Container(
          height: height,
          width: section1_width,
          color: black,
          child: Center(
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                "Dashboard",
                style: bold64white,
              ),
            ),
          ),
        ),
        Container(
          height: height,
          width: 4,
          color: grey5261,
        ),
      ],
    );
  }
}
