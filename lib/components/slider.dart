import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:picktask/components/image_view.dart';
import 'package:picktask/screens/home/model/home_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomSliderWidget extends StatefulWidget {
  final List<Topbaner> items;

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
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.9,
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
                      //launchYoutube(item.link);
                    },
                     child: Padding(
                       padding: const EdgeInsets.only(left: 10),
                       child: ImageView(
                           imageUrl: item.bannerPic??'',
                           isCircular: false,
                           height: 180,
                           width: double.infinity,
                           borderRadius:10),
                     )
                  );
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.items.length, (idx) {
              return activeIndex == idx ? ActiveDot() : InactiveDot();
            })),
      ],
    );
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
