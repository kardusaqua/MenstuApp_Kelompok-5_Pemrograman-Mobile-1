import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TombolSubmit extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const TombolSubmit({Key? key, required this.onPressed, required this.title,})
  : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 50,
      decoration: 
        BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.25),
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 1)
            ],),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide.none
              )),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color(0xffff597d),
          )),
          onPressed: onPressed,
          child: Text(title,
          style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),),
        ),
        );

  }
}