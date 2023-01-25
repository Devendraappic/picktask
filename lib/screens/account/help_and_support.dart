import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "My Leads",
            style: GoogleFonts.poppins(
                color: kWhiteColor,
                fontSize: w * 0.05,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: InkWell(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: w * 0.05),
            // Use the properties stored in the State class.
            width: double.infinity,
            height: !isSelected ? h * 0.031 : h * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            // Define how long the animation should take.
            duration: const Duration(milliseconds: 200),
            // Provide an optional curve to make the animation feel smoother.
            curve: Curves.fastOutSlowIn,

            child: Column(
              children: [
                Container(
                  height: h * 0.03,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [
                            Color(0xFF4530CB),
                            Color(0xFF4530CB),
                            Color(0xFF6A55F7),
                            Color(0xFF4530CB),
                            Color(0xFF4530CB),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(5)),
                  child: Expanded(
                    child: Text(
                      "An FAQ page is one of the simplest ways to \nimprove your site and help site visitors and users.",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.openSans(
                          color: kWhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                space(0.02),
                Expanded(
                  child: Text(
                    "Your FAQ section should be seen as a constantly expanding source of value provided to your audience. It is a place where their ever-changing and growing requirements are not only met but anticipated and exceeded frequently.",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.openSans(
                        color: kBalckColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        )

        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 0.05),
        //   decoration: BoxDecoration(
        //     color: Colors.red,
        //     borderRadius: BorderRadius.circular(w * 0.02),
        //   ),
        //   child: ExpansionTile(
        //     trailing: const SizedBox(),
        //     backgroundColor: kBlueColor,
        //     collapsedBackgroundColor: kWhiteColor,
        //     title: Container(
        //       height: h * 0.03,
        //       width: double.infinity,
        //       decoration: BoxDecoration(
        //           gradient: const LinearGradient(colors: [
        //             Color(0xFF4530CB),
        //             Color(0xFF4530CB),
        //             Color(0xFF6A55F7),
        //             Color(0xFF4530CB),
        //             Color(0xFF4530CB),
        //           ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        //           borderRadius: BorderRadius.circular(5)),
        //       child: Text(
        //         "Question",
        //         textAlign: TextAlign.start,
        //         style: GoogleFonts.openSans(
        //             color: kWhiteColor,
        //             fontSize: 16,
        //             fontWeight: FontWeight.w600),
        //       ),
        //     ),
        //     children: [
        //       ListTile(
        //         title: Text(
        //           "Answer",
        //           textAlign: TextAlign.start,
        //           style: GoogleFonts.openSans(
        //               color: kBackgroundColor,
        //               fontSize: 16,
        //               fontWeight: FontWeight.w600),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        );
  }
}
