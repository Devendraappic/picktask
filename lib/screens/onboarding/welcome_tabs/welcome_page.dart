import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/utils/extra_widget.dart';

class WelcomeTab extends StatelessWidget {

  final String title;
  final String description;
  final String image;

  WelcomeTab(this.title, this.description, this.image);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
       // color: Colors.amberAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.network(
                image,
                fit: BoxFit.scaleDown,
                width: 200,
                height: 200,),
              SizedBox(height: 80,),
              Text(
                title,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: w * 0.06,
                    fontWeight: FontWeight.w700),),
              SizedBox(height: 20,),
              Text(
                description,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: w * 0.035,
                    fontWeight: FontWeight.w400),),

            ],
          ),
        ),
      ),
    );
  }
}