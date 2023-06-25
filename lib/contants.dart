import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/view/mainScreen.dart';
import 'package:get/get.dart';

const kPrimaryColor = Color(0xff918ae2);
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;
const kGreyColor = Color(0xfff5f5f5);
const yellowColor = Color(0xffffd37f);
const kButtonColor = Color(0xff5d55b4);
final kBorderRadius = BorderRadius.circular(10).w;
const kImageUrl = 'assets/';
final kPadding = EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h);

TextStyle headingStyle() =>
    TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w600);

SizedBox sizedHeight(double height) => SizedBox(height: height.h);

class NewWidget extends StatelessWidget {
  final String title;
  final Color bgColor;
  final String imgUrl;
  final Color textColor;

  const NewWidget({
    super.key,
    required this.title,
    required this.bgColor,
    required this.imgUrl,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: kPadding,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                '$kImageUrl' '$imgUrl',
                width: 350.r,
                height: 400.r,
                fit: BoxFit.contain,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 58.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0,
                      color: textColor),
                ),
                sizedHeight(11),
                Text(
                  'Let us help you discover the \nbest food of the week.',
                  style: TextStyle(
                      fontSize: 14.sp,
                      height: 1.6,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                      color: textColor),
                ),
                sizedHeight(40.h),
                ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(170.w, 70.h)),
                      backgroundColor: MaterialStateProperty.all(kButtonColor),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: kBorderRadius))),
                  onPressed: () => Get.to(const MainScreen()),
                  child: Text(
                    'Get Started',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
