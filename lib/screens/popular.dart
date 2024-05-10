import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveling_app/widget/popular_view.dart';

class PopularPage extends StatefulWidget {
  const PopularPage({Key? key}) : super(key: key);

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 247, 255, 1),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PopularPageViewPop(
                  assetImagePath: 'assets/images/krabi_pic.jpg',
                  title: 'Krabi',
                  subtitle: 'Southern Thailand',
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
                PopularPageViewPop(
                  assetImagePath: 'assets/images/benchamabophit_temple.jpg',
                  title: 'Benchamabophit',
                  subtitle: 'Central Thailand',
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
                PopularPageViewPop(
                  assetImagePath: 'assets/images/chinatown_pic.jpg',
                  title: 'China Town',
                  titleColor: Colors.white,
                  subtitleColor: Colors.white,
                  subtitle: 'Central Thailand',
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
                PopularPageViewPop(
                  assetImagePath: 'assets/images/pattaya_pic.jpg',
                  title: 'Pattaya',
                  titleColor: Colors.white,
                  subtitleColor: Colors.white,
                  subtitle: 'South Central Thailand',
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: 0,
            right: 0,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    size: 30.w,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25.w),
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 56, 56, 56)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 13.5.sp,
                          color: Color.fromARGB(255, 143, 143, 143),
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
