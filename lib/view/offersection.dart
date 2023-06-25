import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/contants.dart';
import 'package:foodui/data/data.dart';
import 'package:get/get.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  final PageController controller = PageController(initialPage: 0);
  double _currentItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedHeight(30),
              Text(
                'Top of',
                style: headingStyle(),
              ),
              Row(
                children: [
                  Text(
                    'the day',
                    style: headingStyle(),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Image.asset(
                    '${kImageUrl}burger.png',
                    width: 50.w,
                  )
                ],
              ),
              sizedHeight(40),
              Container(
                width: double.infinity,
                height: 260.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30).w,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xffece1ff),
                          offset: Offset(0, 8),
                          blurRadius: 5.0,
                          spreadRadius: 3)
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.2, 0.9],
                      colors: [
                        kPrimaryColor.withOpacity(0.9),
                        const Color(0xffd6c4f4),
                      ],
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Discover',
                            style: TextStyle(
                                fontSize: 20.sp,
                                height: 2.0.sp,
                                color: const Color(0xffe1d3ef)),
                          ),
                          Text(
                            'Best lunch\nof the day',
                            style: TextStyle(
                                fontSize: 30.sp,
                                color: const Color(0xfffffefd),
                                fontWeight: FontWeight.w500),
                          ),
                          sizedHeight(20),
                          const Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                          )
                        ],
                      ),
                      Image.asset(
                        '${kImageUrl}sushi.png',
                        width: 200.w,
                      )
                    ],
                  ),
                ),
              ),
              sizedHeight(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Most Popular'),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (_currentItemIndex > 0) {
                            _currentItemIndex--;
                            controller.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          }
                        },
                        child: Icon(Icons.arrow_back_ios, size: 14.sp),
                      ),
                      SizedBox(width: 10.w),
                      InkWell(
                        onTap: () {
                          if (_currentItemIndex < getFoodDetails.length - 1) {
                            _currentItemIndex++;
                            controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          }
                        },
                        child: Icon(Icons.arrow_forward_ios, size: 14.sp),
                      ),
                    ],
                  ),
                ],
              ),
              sizedHeight(20),
              SizedBox(
                height: 280.h,
                child: PageView.builder(
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: getFoodDetails.length,
                    itemBuilder: (context, index) {
                      final data = getFoodDetails[index];
                      return Container(
                        width: Get.mediaQuery.size.width * 0.4.w,
                        margin: const EdgeInsets.only(right: 30),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: data.foodColor,
                            borderRadius: BorderRadius.circular(20).w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              data.foodImageUrl,
                              width: 150.w,
                              height: 200.h,
                              alignment: Alignment.center,
                            ),
                            sizedHeight(20),
                            Text(
                              data.foodName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle headingStyle() => TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    wordSpacing: 1.5,
    letterSpacing: 1.5);
