import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:picktask/utils/color.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomSliderWidget extends StatefulWidget {
  // final List<String> items;
  final List items;

  CustomSliderWidget({required this.items});

  @override
  _CustomSliderWidgetState createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  bool isloading = false;

  @override
  void initState() {
    super.initState();
  }

  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("list: ${widget.items}");
    return Obx((() => Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setActiveDot(index);
                  },
                  enableInfiniteScroll: false,
                  autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  // autoPlay: true,
                  viewportFraction: 1,
                ),
                items: widget.items.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          launchYoutube(item.link.toString());
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(item.banner_pic),
                              fit: BoxFit.fill,
                            ),
                          ),
                          // child: Image.asset(),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.items.length, (idx) {
                  return activeIndex == idx ? ActiveDot() : InactiveDot();
                })),
          ],
        )));
  }

  void launchYoutube(var url) async {
    print("launchingUrl: hgh");

    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    }
  }
}

class ActiveDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
