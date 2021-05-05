import 'package:baigundhura_computer/Constants/Colors.dart';
import 'package:baigundhura_computer/Widgets/DrawerItem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 250.0,
                color: CustomColors().mainColors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 5.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: CustomColors().mainColors.white,
                          radius: 60.0,
                          foregroundImage: NetworkImage(
                            'https://unsplash.it/110/110',
                          ),
                        ),
                      ),
                      Text(
                        'निर्देश पोखरेल',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: CustomColors().mainColors.white,
                          ),
                        ),
                      ),
                      Text(
                        '+977 9824930501',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            height: 1.2,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: CustomColors().mainColors.white,
                          ),
                        ),
                      ),
                      Text(
                        'nirdeshpokhrel29@gmail.com',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            height: 1.2,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: CustomColors().mainColors.white,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color:
                              CustomColors().mainColors.black.withOpacity(0.15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 3.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.business_center_rounded,
                                size: 18.0,
                                color: CustomColors()
                                    .mainColors
                                    .white
                                    .withOpacity(0.8),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'सहजकर्ता / प्रोप्राईटर',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    height: 1.5,
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w300,
                                    color: CustomColors().mainColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DrawerItem(
                icon: Icons.dashboard,
                text: 'dashboard'.tr,
                onTap: () {},
              ),
              DrawerItem(
                icon: Icons.people_alt_sharp,
                text: 'all_students'.tr,
                onTap: () {},
              ),
              DrawerItem(
                icon: Icons.person_pin_outlined,
                text: 'all_teachers'.tr,
                onTap: () {},
              ),
              DrawerItem(
                icon: Icons.book_outlined,
                text: 'all_courses'.tr,
                onTap: () {},
              ),
              DrawerItem(
                icon: Icons.attach_money_rounded,
                text: 'all_fees_salary'.tr,
                onTap: () {},
              ),
              DrawerItem(
                icon: Icons.settings,
                text: 'utils'.tr,
                onTap: () {},
              ),
              DrawerItem(
                icon: Icons.text_snippet_rounded,
                text: 'about'.tr,
                onTap: () {},
              ),
              // DrawerItem(
              //   icon: Icons.dashboard,
              //   text: "English",
              //   onTap: () {
              //     Get.updateLocale(CustomLocale().englishLocale);
              //   },
              // ),
              // DrawerItem(
              //   icon: Icons.dashboard,
              //   text: "नेपाली",
              //   onTap: () {
              //     Get.updateLocale(CustomLocale().nepaliLocale);
              //   },
              // ),
              Divider(
                height: 0.05,
                color: CustomColors().mainColors.black.withOpacity(0.2),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage:
                      AssetImage('assets/images/profile_default.png'),
                ),
                title: Text(
                  'app_name'.tr,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                enableFeedback: true,
                enabled: true,
                subtitle: Text(
                  'developed_by'.tr,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(),
                  ),
                ),
                dense: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
