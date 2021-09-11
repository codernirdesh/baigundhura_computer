import 'package:baigundhura_computer/Models/FirebaseModels/Batch.dart';
import 'package:baigundhura_computer/Models/FirebaseModels/Course.dart';

class Student {
  String name;
  String grade;
  int phone;
  String fatherName;
  String motherName;
  String address;
  bool gender;
  Batch batch;
  Course courseTaken;
  Student({
    required this.name,
    required this.grade,
    required this.phone,
    required this.fatherName,
    required this.motherName,
    required this.address,
    required this.gender,
    required this.courseTaken,
    required this.batch,
  });

  Map<String, dynamic> toMap(Student student) {
    return {
      "name": student.name,
      "grade": student.grade,
      "phone": student.phone,
      "fatherName": student.fatherName,
      "motherName": student.motherName,
      "address": student.address,
      "gender": student.gender,
      "courseTaken": {
        "name": student.courseTaken.name,
        "fee": student.courseTaken.fee,
        "duration": student.courseTaken.duration,
      },
      "batch": {
        "id": student.batch.id,
        "name": student.batch.name,
      }
    };
  }

  Student fromJson(Map<String, dynamic> data) {
    Student? student;
    student!.name = data['name'].toString();
    student.grade = data['grade'].toString();
    student.phone = data['phone'];
    student.fatherName = data['fatherName'].toString();
    student.motherName = data['motherName'].toString();
    student.address = data['address'].toString();
    student.gender = data['gender'];

    student.courseTaken = Course(
      name: data['courseTaken']['name'].toString(),
      fee: data['courseTaken']['fee'],
      duration: data['courseTaken']['duration'],
    );
    student.batch = Batch(
      name: data['batch']['name'],
      id: data['batch']['id'],
    );
    return student;
  }
}
