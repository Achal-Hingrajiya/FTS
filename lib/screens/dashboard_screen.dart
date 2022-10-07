import 'package:flutter/material.dart';
import 'package:office_doc_tracing/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle,
                    color: greyA5A5A5,
                  ),
                  Text("Create new document")
                ],
              ),
            )
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
          color: green6EEB83,
        ),
      ],
    );
  }
}
