import 'package:baigundhura_computer/Constants/Colors.dart';
import 'package:baigundhura_computer/Models/FirebaseModels/Batch.dart';
import 'package:baigundhura_computer/Models/FirebaseModels/Course.dart';
import 'package:baigundhura_computer/Models/FirebaseModels/Student.dart';
import 'package:baigundhura_computer/Services/FireStoreService.dart';
import 'package:baigundhura_computer/utils/Locale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  List<Course> courses = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController parentPhoneController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    addressController.text = 'address_value'.tr;
  }

  @override
  Widget build(BuildContext context) {
    String? currentClass = 'class_6'.tr;
    Course? currentCourseObject = Course(
      name: "Computer Accounting",
      fee: 2500,
      duration: 1.5,
    );
    Batch? currentBatchObject = Batch(
      name: "First Batch",
      id: 1,
    );
    String currentGender = 'male'.tr;
    List<String> genderList = ['male'.tr, 'female'.tr, 'third_gendered'.tr];
    List<String> classList = [
      'class_6'.tr,
      'class_7'.tr,
      'class_8'.tr,
      'class_9'.tr,
      'class_10'.tr,
      'class_11'.tr,
      'class_12'.tr,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'add_student'.tr,
          style: GoogleFonts.poppins(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print(Get.locale);
              if (Get.locale == CustomLocale().englishLocale) {
                Get.updateLocale(CustomLocale().nepaliLocale);
              } else if (Get.locale == CustomLocale().nepaliLocale) {
                Get.updateLocale(CustomLocale().englishLocale);
              }
            },
            icon: Icon(Icons.translate_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      maxLength: 25,
                      controller: nameController,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "name".tr,
                        hintText: "dummy_name".tr,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_add_alt_1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: parentPhoneController,
                      maxLength: 10,
                      decoration: InputDecoration(
                        labelText: "phone_number".tr,
                        hintText: "98xxxxxxxx",
                        border: OutlineInputBorder(),
                        isDense: true,
                        isCollapsed: false,
                        prefixIcon: Icon(Icons.phone_android),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      maxLength: 25,
                      controller: fatherNameController,
                      decoration: InputDecoration(
                        labelText: "father_name".tr,
                        hintText: "father_name_value".tr,
                        border: OutlineInputBorder(),
                        isDense: true,
                        isCollapsed: false,
                        prefixIcon: Icon(Icons.person_pin_outlined),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      maxLength: 25,
                      controller: motherNameController,
                      decoration: InputDecoration(
                        labelText: "mother_name".tr,
                        hintText: "mother_name_value".tr,
                        border: OutlineInputBorder(),
                        isDense: true,
                        isCollapsed: false,
                        prefixIcon: Icon(Icons.person_pin_outlined),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      maxLength: 25,
                      controller: addressController,
                      decoration: InputDecoration(
                        labelText: "address".tr,
                        hintText: "address_value".tr,
                        border: OutlineInputBorder(),
                        isDense: true,
                        isCollapsed: false,
                        prefixIcon: Icon(
                          Icons.location_on_rounded,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: DropdownButtonFormField(
                              value: currentGender,
                              isDense: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.people_alt),
                              ),
                              items: genderList
                                  .map(
                                    (classFromClassList) => DropdownMenuItem(
                                      value: classFromClassList,
                                      child: Text(
                                        classFromClassList.toString(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  currentGender = value as String;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10.0,
                              left: 6.0,
                            ),
                            child: DropdownButtonFormField(
                              value: currentClass,
                              isDense: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.class__outlined),
                              ),
                              items: classList
                                  .map(
                                    (classFromClassList) => DropdownMenuItem(
                                      value: classFromClassList,
                                      child: Text(
                                        classFromClassList.toString(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  currentClass = value as String;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10.0,
                      left: 0.0,
                    ),
                    child: FutureBuilder(
                        future: FireStoreService().getmyBatches(),
                        builder:
                            (context, AsyncSnapshot<List<Batch>> snapshot) {
                          return snapshot.hasData
                              ? DropdownButtonFormField(
                                  // value: snapshot.data![0].name,
                                  value: currentBatchObject!.name ??
                                      Batch(
                                        name: "First Batch",
                                        id: 1,
                                      ),
                                  isDense: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.class__outlined),
                                  ),
                                  items: snapshot.data!
                                      .map(
                                        (courseFromFirebase) =>
                                            DropdownMenuItem(
                                          value: courseFromFirebase.name,
                                          child: Text(
                                            courseFromFirebase.name.toString(),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    Batch selectedBatch =
                                        snapshot.data!.singleWhere(
                                      (element) =>
                                          element.name == value.toString(),
                                    );
                                    setState(() {
                                      currentBatchObject = selectedBatch;
                                      // currentCourseObject = value as Course;
                                    });
                                    print(currentBatchObject!.name);
                                  },
                                )
                              : CircularProgressIndicator();
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10.0,
                      left: 0.0,
                    ),
                    child: FutureBuilder(
                      future: FireStoreService().getmyCourses(),
                      builder: (context, AsyncSnapshot<List<Course>> snapshot) {
                        return snapshot.hasData
                            ? DropdownButtonFormField(
                                // value: snapshot.data![0].name,
                                // value: currentCourse,
                                value: currentCourseObject!.name ??
                                    Course(
                                      name: "Computer Basics",
                                      fee: 2500,
                                      duration: 1.5,
                                    ),
                                isDense: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.class__outlined),
                                ),
                                items: snapshot.data!
                                    .map(
                                      (courseFromFirebase) => DropdownMenuItem(
                                        value: courseFromFirebase.name,
                                        child: Text(
                                          courseFromFirebase.name.toString(),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  Course selectedCourse =
                                      snapshot.data!.singleWhere(
                                    (element) =>
                                        element.name == value.toString(),
                                  );
                                  setState(() {
                                    currentCourseObject = selectedCourse;
                                    // currentCourseObject = value as Course;
                                  });
                                  print(currentCourseObject!.name);
                                },
                              )
                            : CircularProgressIndicator();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      maxLength: 25,
                      controller: dateController,
                      decoration: InputDecoration(
                        labelText: "address".tr,
                        hintText: "address_value".tr,
                        border: OutlineInputBorder(),
                        isDense: true,
                        isCollapsed: false,
                        prefixIcon: Icon(
                          Icons.location_on_rounded,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: MaterialButton(
                      onPressed: () {
                        String name = nameController.text.toString();
                        int? phone =
                            int.tryParse(parentPhoneController.text.toString());
                        String fatherName =
                            fatherNameController.text.toString();
                        String motherName =
                            motherNameController.text.toString();
                        String address = addressController.text.toString();

                        bool validateName(String name) {
                          if (name.isNotEmpty && name.length >= 8) {
                            return true;
                          } else {
                            return false;
                          }
                        }

                        bool validatePhone(int phone) {
                          if (phone.isFinite &&
                              !phone.isNegative &&
                              phone.isGreaterThan(9800000000) &&
                              phone.isLowerThan(9899999999)) {
                            return true;
                          } else {
                            return false;
                          }
                        }

                        bool validateFatherName(String name) {
                          if (name.isNotEmpty && name.length >= 8) {
                            return true;
                          } else {
                            return false;
                          }
                        }

                        bool validateMotherName(String name) {
                          if (name.isNotEmpty && name.length >= 8) {
                            return true;
                          } else {
                            return false;
                          }
                        }

                        bool validateAddress(String name) {
                          if (name.isNotEmpty && name.length >= 8) {
                            return true;
                          } else {
                            return false;
                          }
                        }

                        bool formIsValid = false;
                        if (validateName(
                              name.removeAllWhitespace,
                            ) &&
                            validatePhone(
                              phone!,
                            ) &&
                            validateFatherName(
                              fatherName.removeAllWhitespace,
                            ) &&
                            validateMotherName(
                              motherName.removeAllWhitespace,
                            ) &&
                            validateAddress(
                              address.removeAllWhitespace,
                            )) {
                          formIsValid = true;
                        }
                        admitStudent() {
                          _getGender() {
                            if (currentGender == "Male" ||
                                currentGender == "छात्र") {
                              return true;
                            } else {
                              return false;
                            }
                          }

                          Student student = Student(
                            name: name,
                            grade: currentClass.toString(),
                            phone: phone!,
                            fatherName: fatherName,
                            motherName: motherName,
                            address: address,
                            gender: _getGender(),
                            courseTaken: currentCourseObject!,
                            batch: currentBatchObject!,
                          );
                          FireStoreService()
                              .studentCollection
                              .add(student.toMap(student))
                              .then(
                                (value) => Get.defaultDialog(
                                  title: "Success!".tr,
                                  barrierDismissible: false,
                                  content: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                    child: Text(
                                      "Student $name added successfully!",
                                      style: GoogleFonts.poppins(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  confirmTextColor:
                                      CustomColors().mainColors.white,
                                  buttonColor: CustomColors().mainColors.red,
                                  confirm: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: double.maxFinite,
                                      child: MaterialButton(
                                        onPressed: () {
                                          Get.offNamed('/');
                                        },
                                        color: CustomColors().mainColors.red,
                                        textColor:
                                            CustomColors().mainColors.white,
                                        child: Text(
                                          "ok".tr,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                      ),
                                    ),
                                  ),
                                  radius: 8.0,
                                  titleStyle: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                        }

                        formIsValid
                            ? admitStudent()
                            : Get.defaultDialog(
                                title: "error_title".tr,
                                barrierDismissible: true,
                                textConfirm: "Ok",
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Text(
                                    "form_error_message".tr,
                                    style: GoogleFonts.poppins(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                confirmTextColor:
                                    CustomColors().mainColors.white,
                                buttonColor: CustomColors().mainColors.red,
                                confirm: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.maxFinite,
                                    child: MaterialButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      color: CustomColors().mainColors.red,
                                      textColor:
                                          CustomColors().mainColors.white,
                                      child: Text(
                                        "ok".tr,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                    ),
                                  ),
                                ),
                                radius: 8.0,
                                titleStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                      },
                      color: CustomColors().mainColors.red,
                      elevation: 0.0,
                      padding: EdgeInsets.all(15.0),
                      hoverElevation: 5.0,
                      focusElevation: 5.0,
                      highlightElevation: 5.0,
                      child: Center(
                        child: Text(
                          "admit_student".tr,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: CustomColors().mainColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
