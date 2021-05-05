import 'package:baigundhura_computer/Widgets/Drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          "app_name".tr,
          style: GoogleFonts.poppins(),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Movies').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          snapshot.hasData ? print(snapshot.data) : print("Does not have data");
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(snapshot.data!.docs[index]['title']),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
