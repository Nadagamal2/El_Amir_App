import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../app_style.dart';

class TodayTasksComponent extends StatelessWidget {
    TodayTasksComponent({Key? key, required this.text1, required this.text2,this.color,this.color2,this.border}) : super(key: key);
final String text1;
final String text2;
Color? color;
Color? color2;
Border? border;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        height: 60.h,
        width: 35.h,
        decoration: BoxDecoration(
          color: color,
            borderRadius: BorderRadius.circular(5.r),
            border: border,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(
                  color: Styles.defaultColor8,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),
            ),
            Gap(10.h),
            Text(
              text2,
              style: TextStyle(
                  color: color2,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
