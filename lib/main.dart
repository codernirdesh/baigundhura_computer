import 'package:baigundhura_computer/Constants/Colors.dart';
import 'package:baigundhura_computer/Screens/HomePage/HomePage.dart';
import 'package:baigundhura_computer/utils/Locale.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baigundhura_computer/utils/TranslationsCustom.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VotingApp());
}

class VotingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: TranslationsCustom(),
      title: 'app_name'.tr,
      debugShowCheckedModeBanner: true,
      locale: CustomLocale().englishLocale,
      fallbackLocale: CustomLocale().englishLocale,
      home: HomePage(),
      color: CustomColors().mainColors.red,
      theme: ThemeData(
        primaryColor: CustomColors().mainColors.red,
        primaryIconTheme: IconThemeData(color: CustomColors().mainColors.white),
        splashColor: CustomColors().mainColors.red,
      ),
    );
  }
}
