import 'package:baigundhura_computer/Models/FirebaseModels/Batch.dart';
import 'package:baigundhura_computer/Models/FirebaseModels/Course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  CollectionReference _courseCollectionReference =
      FirebaseFirestore.instance.collection('Courses');
  CollectionReference _batchCollectionReference =
      FirebaseFirestore.instance.collection('Batches');
  CollectionReference _studentCollectionReference =
      FirebaseFirestore.instance.collection('Students');
  CollectionReference get batcheCollection => this._batchCollectionReference;
  CollectionReference get courseCollection => this._courseCollectionReference;
  CollectionReference get studentCollection => this._studentCollectionReference;

  //
  //
  //
  // ** TEST
  //
  //
  //
  Future<List<Course>> getmyCourses() async {
    List<Course> courses = [];
    QuerySnapshot coursesAll = await _courseCollectionReference.get();
    courses = coursesAll.docs
        .map(
          (element) => Course(
            name: element['name'],
            fee: int.tryParse(element['fee'].toString()),
            duration: double.tryParse(element['duration'].toString()),
          ),
        )
        .toList();
    return courses;
  }

  Future<List<Batch>> getmyBatches() async {
    List<Batch> batches = [];
    QuerySnapshot batchesAll = await _batchCollectionReference.get();
    batches = batchesAll.docs
        .map(
          (element) => Batch(
            id: element['id'],
            name: element['name'],
          ),
        )
        .toList();
    return batches;
  }
}
