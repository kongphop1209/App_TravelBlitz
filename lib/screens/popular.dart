import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          PopUpView(),
          UnderDestination(),
          RecommendDestination(),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.07,
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
                      color: Color.fromARGB(202, 255, 255, 255),
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
                          color: Color.fromARGB(255, 73, 73, 73),
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

/// ========== Under here was the Widget ============///
class PopUpView extends StatefulWidget {
  const PopUpView({Key? key}) : super(key: key);

  @override
  State<PopUpView> createState() => _PopUpViewState();
}

class _PopUpViewState extends State<PopUpView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: MediaQuery.of(context).size.height * 0.4,
        child: AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            return PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return PopularPageViewPop(
                  assetImagePath: index == 0
                      ? 'assets/images/krabi_pic.jpg'
                      : index == 1
                          ? 'assets/images/benchamabophit_temple.jpg'
                          : index == 2
                              ? 'assets/images/chinatown_pic.jpg'
                              : 'assets/images/pattaya_pic.jpg',
                  title: index == 0
                      ? 'Krabi'
                      : index == 1
                          ? 'Benchamabophit'
                          : index == 2
                              ? 'China Town'
                              : 'Pattaya',
                  subtitle: index == 0
                      ? 'Southern Thailand'
                      : index == 1
                          ? 'Central Thailand'
                          : index == 2
                              ? 'Central Thailand'
                              : 'South Central Thailand',
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.height * 0.2,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class UnderDestination extends StatelessWidget {
  const UnderDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        bottom: MediaQuery.of(context).size.height * 0.33,
        left: MediaQuery.of(context).size.width * 0.07,
        right: 0,
        child: Text(
          'Popular Destination',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class RecommendDestination extends StatelessWidget {
  const RecommendDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        bottom: MediaQuery.of(context).size.height * 0.13,
        left: 0,
        right: 0,
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/bangkok.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Image.asset(
                    'assets/images/northern.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Image.asset(
                    'assets/images/western.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Image.asset(
                    'assets/images/southern.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
