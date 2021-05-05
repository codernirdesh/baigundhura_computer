import 'package:baigundhura_computer/Constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerItem extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final IconData icon;
  const DrawerItem({
    Key? key,
    required this.onTap,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: ListTile(
        dense: false,
        leading: Icon(
          icon,
          color: CustomColors().mainColors.red,
        ),
        title: Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 16.0),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
