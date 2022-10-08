import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:office_doc_tracing/screens/login_screen.dart';
import 'package:office_doc_tracing/screens/user_dispatched_files.dart';
import 'package:office_doc_tracing/screens/user_pending_files.dart';
import 'package:office_doc_tracing/screens/user_received_files.dart';
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
    return Scaffold(
      body: Row(
        children: [
          buildSidePanel(context),
          buildMainArea(context),
        ],
      ),
    );
  }

  Container buildMainArea(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      color: Color(0xFFF0F5F9),
      child: Column(
        children: [
          buildHeader(context),
          Padding(
            padding: EdgeInsets.only(right: 40, left: 40, top: 40),
            child: Wrap(
              spacing: 150,
              children: [
                buildCardview("Received Files", "100", UserReceivedFiles()),
                buildCardview("Dispatched Files", "100", UserDispathcedFiles()),
                buildCardview("Pending Files", "100", UserPendingFiles()),

              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.1,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "File Tracking System",
            style: TextStyle(
                fontSize: 30,
                color: Color(0xFF1E2022),
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.logout,
                    size: 30,
                  )),
            ],
          )
        ],
      ),
    );
  }

  Container buildSidePanel(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height,
      color: Color(0xFF1E2022),
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 0, 20),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.cyan,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(15)),
                  Text(
                    "Hirva",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF0F5F9),
                        fontSize: 35),
                  ),
                ],
              ),
              buildUserManagementPanel(),
              buildUserAccessManagementPanel(),
              buildFileMovementPanel(),
              buildFileManagementPanel(),
              buildAdditionalFunctionalities()
            ],
          ),
        ),
      ),
    );
  }

  Container buildUserManagementPanel() {
    return Container(
      padding: EdgeInsets.only(top: 40, right: 40, left: 40, bottom: 5),
      child: ExpandablePanel(
        header: SizedBox(
          child: Row(
            children: [
              Icon(Icons.folder, color: Colors.white, size: 24),
              SizedBox(
                width: 10,
              ),
              Text(
                "User Management",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        collapsed: SizedBox(),
        theme: ExpandableThemeData(iconColor: Colors.white),
        expanded: Column(
          children: [
            Row(
              children: [
                Icon(Icons.person_add_alt_rounded,
                    color: Colors.white, size: 20),
                SizedBox(
                  width: 15,
                ),
                Text("Create User",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.person_off, color: Colors.white, size: 20),
                SizedBox(
                  width: 15,
                ),
                Text("Delete User",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.update, color: Colors.white, size: 20),
                SizedBox(
                  width: 15,
                ),
                Text("Update User",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        builder: (context, collapsed, expanded) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Expandable(
              collapsed: collapsed,
              expanded: expanded,
            ),
          );
        },
      ),
    );
  }

  Container buildUserAccessManagementPanel() {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40, bottom: 5),
      child: ExpandablePanel(
        header: SizedBox(
          child: Row(children: [
            Icon(Icons.folder, color: Colors.white, size: 24),
            SizedBox(
              width: 10,
            ),
            Text("User Access Management",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ]),
        ),
        collapsed: SizedBox(),
        theme: ExpandableThemeData(iconColor: Colors.white),
        expanded: Column(
          children: [
            Row(
              children: [
                Icon(Icons.add_circle, color: Colors.white, size: 20),
                SizedBox(
                  width: 15,
                ),
                Text("Grant Functionalities",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.remove_circle, color: Colors.white, size: 20),
                SizedBox(
                  width: 15,
                ),
                Text("Revoke Functionalities",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        builder: (context, collapsed, expanded) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Expandable(
              collapsed: collapsed,
              expanded: expanded,
            ),
          );
        },
      ),
    );
  }

  Container buildFileMovementPanel() {
    return Container(
      padding: EdgeInsets.only(right: 40, left: 40, bottom: 5),
      child: ExpandablePanel(
        header: SizedBox(
          child: Row(children: [
            Icon(Icons.folder, color: Colors.white, size: 24),
            SizedBox(
              width: 10,
            ),
            Text("File Movement ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ]),
        ),
        collapsed: SizedBox(),
        theme: ExpandableThemeData(iconColor: Colors.white),
        expanded: Column(
          children: [
            buildFunctionality(
              LoginScreen(),
              Icons.location_on_sharp,
              "File Tracking",
            ),
            SizedBox(
              height: 10,
            ),
            buildFunctionality(
              LoginScreen(),
              Icons.file_upload,
              "Dispatch File",
            ),
            SizedBox(
              height: 10,
            ),
            buildFunctionality(
              LoginScreen(),
              Icons.update,
              "Update Dispatched File Details",
            ),
            SizedBox(
              height: 10,
            ),
            buildFunctionality(
              LoginScreen(),
              Icons.file_copy,
              "Check File Status",
            ),
            SizedBox(
              height: 10,
            ),
            buildFunctionality(
              LoginScreen(),
              Icons.search,
              "Search Files",
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        builder: (context, collapsed, expanded) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Expandable(
              collapsed: collapsed,
              expanded: expanded,
            ),
          );
        },
      ),
    );
  }

  InkWell buildFunctionality(
    Widget screen,
    IconData iconData,
    String functionalityName,
  ) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            functionalityName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Container buildFileManagementPanel() {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40, bottom: 5),
      child: ExpandablePanel(
        header: SizedBox(
          child: Row(children: [
            Icon(Icons.folder, color: Colors.white, size: 24),
            SizedBox(
              width: 10,
            ),
            Text("File Management",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ]),
        ),
        collapsed: SizedBox(),
        theme: ExpandableThemeData(iconColor: Colors.white),
        expanded: Column(
          children: [
            buildFunctionality(
              LoginScreen(),
              Icons.create_new_folder,
              "Create File ",
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.folder_off, color: Colors.white, size: 20),
                SizedBox(
                  width: 15,
                ),
                Text("Delete File",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.update, color: Colors.white, size: 20),
                SizedBox(
                  width: 15,
                ),
                Text("Update File",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ],
            )
          ],
        ),
        builder: (context, collapsed, expanded) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Expandable(
              collapsed: collapsed,
              expanded: expanded,
            ),
          );
        },
      ),
    );
  }

  Container buildAdditionalFunctionalities() {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40, bottom: 5),
      child: Column(
        children: [
          Row(children: [
            Icon(Icons.folder, color: Colors.white, size: 24),
            SizedBox(
              width: 10,
            ),
            Text("Download User Mannual",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ]),
          SizedBox(
            height: 35,
          ),
          Row(children: [
            Icon(Icons.folder, color: Colors.white, size: 24),
            SizedBox(
              width: 10,
            ),
            Text("Make Announcement",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ]),
          SizedBox(
            height: 35,
          ),
          Row(children: [
            Icon(Icons.folder, color: Colors.white, size: 24),
            SizedBox(
              width: 10,
            ),
            Text("View Announcement",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ]),
          SizedBox(
            height: 35,
          ),
          Row(children: [
            Icon(Icons.folder, color: Colors.white, size: 24),
            SizedBox(
              width: 10,
            ),
            Text("Summary Report",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ]),
        ],
      ),
    );
  }

  buildCardview(String s, String files, Widget screen) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
      child: Container(
        // padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(
          bottom: 20,
          top: 20,
        ),
        width: 200,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 35, left: 10, right: 10, bottom: 10),
              child: Column(
                children: [
                  Icon(
                    Icons.file_copy,
                    size: 40,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    s,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5)),
                color: Color(0xFFD9D9D9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    files,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
// Widget build(BuildContext context) {
//   var height = MediaQuery.of(context).size.height;
//   var width = MediaQuery.of(context).size.width;
//   var section1_width = width * 0.3265625;
//   var pading_around_form_desktop = EdgeInsets.fromLTRB(
//     width * 0.1015625,
//     height * 0.25277,
//     width * 0.10703,
//     height * 0.25277,
//   );
//   var pading_around_form_mobile = EdgeInsets.fromLTRB(
//     width * 0.1015625,
//     height * 0.22462,
//     width * 0.10703,
//     height * 0.10321,
//   );
//
//   print("heiiiight: $height");
//   print("wiiiiidth: $width");
//   return Scaffold(
//     appBar: AppBar(
//       automaticallyImplyLeading: true,
//       backgroundColor: black,
//     ),
//     drawer: Drawer(
//       child: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder: (context) => CreateUserScreen(),
//                 ),
//               );
//             },
//             child: Text(
//               "Create new user",
//             ),
//           ),
//         ],
//       ),
//     ),
//     body: width > 1000
//         ? _buildDesktopDashboardScreen(
//             height,
//             section1_width,
//             pading_around_form_desktop,
//             context,
//           )
//         : _buildDesktopDashboardScreen(
//             height,
//             section1_width,
//             pading_around_form_desktop,
//             context,
//           ),
//   );
// }
//
// Row _buildDesktopDashboardScreen(
//   double height,
//   double section1_width,
//   EdgeInsets pading_around_form,
//   BuildContext context,
// ) {
//   return Row(
//     children: [
//       Container(
//         height: height,
//         width: section1_width,
//         color: black,
//         child: Center(
//           child: RotatedBox(
//             quarterTurns: -1,
//             child: Text(
//               "Dashboard",
//               style: bold64white,
//             ),
//           ),
//         ),
//       ),
//       Container(
//         height: height,
//         width: 4,
//         color: grey5261,
//       ),
//     ],
//   );
// }
}
