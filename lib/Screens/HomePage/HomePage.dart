import 'package:baigundhura_computer/Constants/Colors.dart';
import 'package:baigundhura_computer/Widgets/Drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference _movieReference =
      FirebaseFirestore.instance.collection('Movies');
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
        stream: _movieReference.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => Card(
                  elevation: 2.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: CachedNetworkImage(
                          fit: BoxFit.contain,
                          imageUrl:
                              snapshot.data!.docs[index]['imageURL'].toString(),
                        ),
                      ),
                      // Image.network(snapshot.data!.docs[index]['image_URL']),
                      ListTile(
                        title: Text(
                          snapshot.data!.docs[index]['title'],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data!.docs[index]['description'],
                          textAlign: TextAlign.justify,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            var docID = snapshot.data!.docs[index].id;
                            Get.defaultDialog(
                              content: Text(
                                " ${snapshot.data!.docs[index]['title']} ",
                              ),
                              title: "Are you sure to delete ?",
                              barrierDismissible: false,
                              textCancel: "Cancel",
                              textConfirm: "Confirm Delete",
                              confirmTextColor: CustomColors().mainColors.white,
                              buttonColor: CustomColors().mainColors.red,
                              cancelTextColor: CustomColors().mainColors.black,
                              radius: 8.0,
                              titleStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onConfirm: () {
                                _movieReference.doc(docID).delete().then(
                                  (value) {
                                    print(
                                      "Document with id $docID deleted successfully",
                                    );
                                  },
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.delete_rounded,
                            color: CustomColors().mainColors.red,
                          ),
                        ),
                        onTap: () {
                          try {
                            print(snapshot.data!.docs[index]['description']);
                          } catch (e) {
                            print(e.toString());
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
