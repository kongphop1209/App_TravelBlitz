import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetIntro extends StatelessWidget {
  const WidgetIntro(
      {super.key,
      required this.image,
      this.fit,
      this.style,
      required this.title,
      required this.subtitle});

  final String image, title, subtitle;
  final String? style, fit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Image(
          width: MediaQuery.of(context).size.width * 0.5,
          image: AssetImage(image),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        Text(
          textAlign: TextAlign.center,
          title,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Text(
          textAlign: TextAlign.center,
          subtitle,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
