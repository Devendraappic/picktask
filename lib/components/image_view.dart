import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {

  String imageUrl;
  double? width;
  double? height;
  bool isCircular;
  double? radius;
  double? borderRadius;
  ImageView({Key? key, required this.imageUrl, this.height, this.width,required this.isCircular, this.radius,this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCircular== true?
    ClipOval(
      child: SizedBox.fromSize(
        size:  Size.fromRadius(radius??25), // Image radius
        child: imageWidget(),
      ),
    )
        :ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius??8),
        child: imageWidget());
  }
  Widget imageWidget(){
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Image.asset(
        "assets/images/logo1.jpg",
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
      errorWidget: (context, url, error) => Image.asset(
        "assets/images/logo1.jpg",
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }
}

