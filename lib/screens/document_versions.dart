import 'package:flutter/material.dart';

class DocumentVersionScreen extends StatefulWidget {
  const DocumentVersionScreen({Key? key}) : super(key: key);

  @override
  State<DocumentVersionScreen> createState() => _DocumentVersionScreenState();
}

class _DocumentVersionScreenState extends State<DocumentVersionScreen> {
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.12,
              alignment: Alignment.centerLeft,
              color: Color(0xFF1E2022),
              padding: EdgeInsets.only(left: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("World Map",style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Text("Document No. : 12345",style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              )
          ),
          SizedBox(height: 30,),
          Container(
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
                  Icon(Icons.folder, size: 70,),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Created by: Mr. Nitin Patel", style: TextStyle(fontSize: 20, color: Color(0xFF1E2022), fontWeight: FontWeight.bold)),
                      SizedBox(height: 10,),
                      Text("Creation time: 16/12/2022", style: TextStyle(fontSize: 16, color: Color(0xFF1E2022),)),
                      SizedBox(height: 10,),
                      Text("Description : This is Demo...", style: TextStyle(fontSize: 16, color: Color(0xFF1E2022),)),

                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      ElevatedButton(onPressed: () {

                      }, style: ElevatedButton.styleFrom(primary: Color(0xFF1E2022)),child: Container(
                        alignment: Alignment.centerRight,
                        color: Color(0xFF1E2022),
                        child: Text("View Document", style: TextStyle(fontSize: 18)),
                      )),
                    ],
                  )


                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
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
                  Icon(Icons.folder, size: 70,),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Created by: Mr. Dhairya Soni", style: TextStyle(fontSize: 20, color: Color(0xFF1E2022), fontWeight: FontWeight.bold)),
                      SizedBox(height: 10,),
                      Text("Creation time: 10/08/2022", style: TextStyle(fontSize: 16, color: Color(0xFF1E2022),)),
                      SizedBox(height: 10,),
                      Text("Description : This is Demo...", style: TextStyle(fontSize: 16, color: Color(0xFF1E2022),)),

                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      ElevatedButton(onPressed: () {

                      }, style: ElevatedButton.styleFrom(primary: Color(0xFF1E2022)),child: Container(
                        alignment: Alignment.centerRight,
                        color: Color(0xFF1E2022),
                        child: Text("View Document", style: TextStyle(fontSize: 18)),
                      )),
                    ],
                  )


                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
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
                  Icon(Icons.folder, size: 70,),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Created by: Mr. Hardik", style: TextStyle(fontSize: 20, color: Color(0xFF1E2022), fontWeight: FontWeight.bold)),
                      SizedBox(height: 10,),
                      Text("Creation time: 05/02/2022", style: TextStyle(fontSize: 16, color: Color(0xFF1E2022),)),
                      SizedBox(height: 10,),
                      Text("Description : This is Demo...", style: TextStyle(fontSize: 16, color: Color(0xFF1E2022),)),

                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      ElevatedButton(onPressed: () {

                      }, style: ElevatedButton.styleFrom(primary: Color(0xFF1E2022)),child: Container(
                        alignment: Alignment.centerRight,
                        color: Color(0xFF1E2022),
                        child: Text("View Document", style: TextStyle(fontSize: 18)),
                      )),
                    ],
                  )


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
