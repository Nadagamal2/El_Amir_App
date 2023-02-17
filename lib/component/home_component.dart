import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeComponent extends StatelessWidget {
    const HomeComponent({Key? key, required this.text1, required this.image1, required this.text2, required this.image2, this.onTap1, this.onTap2}) : super(key: key);
 final String text1;
 final String text2;
 final Image image1;
 final Image image2;
 final Function()? onTap1;
 final Function()? onTap2;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: onTap1,
              child: Container(
                height: 120.h,
                width: 155.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:   EdgeInsets.all(20.0.h),
                  child: Column(
                    children: [
                      image1,
                      Gap(8.h),
                      Text(
                       text1,
                        style: TextStyle(
                            fontSize: 17.sp,
                            //   fontFamily: 'font1',
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Gap(10.h),
          Expanded(
            child: InkWell(
              onTap: onTap2,
              child: Container(
                height: 120.h,
                width: 155.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:   EdgeInsets.all(20.0.h),
                  child: Column(
                    children: [
                      image2,
                      Gap(8),
                      Text(
                        text2,
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
