import 'package:flutter/material.dart';

class UserPendingFiles extends StatefulWidget {
  const UserPendingFiles({Key? key}) : super(key: key);

  @override
  State<UserPendingFiles> createState() => _UserPendingFilesState();
}

class _UserPendingFilesState extends State<UserPendingFiles> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.12,
            alignment: Alignment.centerLeft,
            color: Color(0xFF1E2022),
            padding: EdgeInsets.only(left: 80),
            child: Text("Pending Documents of Achal",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 30,
          ),
          buildDocumentContainer(),
          SizedBox(
            height: 10,
          ),
          buildDocumentContainer(),
          SizedBox(
            height: 10,
          ),
          buildDocumentContainer(),
          SizedBox(
            height: 10,
          ),
          buildDocumentContainer(),
        ],
      ),
    );
  }

  Container buildDocumentContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFD9D9D9),
      ),
      padding: EdgeInsets.all(15),
      alignment: Alignment.centerLeft,
      width: 1000,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.folder,
              size: 70,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("World Map",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF1E2022),
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Text("Document No. : 12345",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1E2022),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("Last Updated Date: 16/12/2022",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF1E2022),
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 50,
                    ),
                    Text("Last Updated by: Mr. Nitin Patel",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF1E2022),
                            fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
            Expanded(child: Container()),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: Color(0xFF1E2022)),
                    child: Container(
                      alignment: Alignment.centerRight,
                      color: Color(0xFF1E2022),
                      child:
                      Text("View Versions", style: TextStyle(fontSize: 18)),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text("16 Versions Available",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1E2022),
                        fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
    );
  }
}
