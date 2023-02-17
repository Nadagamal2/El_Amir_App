import 'package:alamir_app/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'login_screen.dart';
  class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final userData =GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Styles.defaultColor6,

      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: 639.h,
              child: Stack(
                children: [
                  Positioned(
                    top: -150.h,
                    right: -45.h,
                    height: 840.h,
                    child: Image(
                        fit: BoxFit.cover,
                        width: 315.h,
                        image: AssetImage(
                          'assets/g14.png',
                        )),
                  ),
                ],
              ),
            ),

           Padding(
             padding:   EdgeInsets.symmetric(horizontal:  20.h,vertical: 30.h),
             child: Center(
               child: Column(


                 children: [
                   Text('بيانات المستخدم',style: TextStyle(
                       color: Styles.defaultColor2,
                       fontSize: 23.sp,
                       fontWeight: FontWeight.w600),),
                   Gap(50.h),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Text(': البريد الالكتروني',style: TextStyle(
                           color: Styles.defaultColor10,
                           fontSize: 15.sp,
                           fontWeight: FontWeight.w600),)
                     ],
                   ),
                   Gap(10.h),
                   Container(
                     height: 43.h,
                     width: double.infinity,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(7.5.r),
                       border: Border.all(color: Colors.grey.shade400,width: .5),
                     ),
                     child: Center(
                       child: Text('${userData.read('email')}',style: TextStyle(
                           color: Styles.defaultColor7,
                           fontSize: 15.sp,
                           fontWeight: FontWeight.w500

                       ),),
                     ),
                     ),
                   Gap(10.h),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Text(':  كملة السر',style: TextStyle(
                           color: Styles.defaultColor10,
                           fontSize: 15.sp,
                           fontWeight: FontWeight.w600),)
                     ],
                   ),
                   Gap(10.h),
                   Container(
                     height: 43.h,
                     width: double.infinity,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(7.5.r),
                       border: Border.all(color: Colors.grey.shade400,width: .5),
                     ),
                     child: Center(
                       child: Text('${userData.read('password')}',style: TextStyle(
                           color: Styles.defaultColor7,
                           fontSize: 15.sp,
                           fontWeight: FontWeight.w500

                       ),),
                     ),
                   ),
                   Gap(70.h),
                   buildBottum(height: 43.h, width: double.infinity,
                     decoration: BoxDecoration(
                       color: Styles.defaultColor2,

                       borderRadius: BorderRadius.circular(7.5.r),
                     ),
                     text:  Text(
                       'تسجيل خروج',
                       style: TextStyle(
                         color: Styles.defaultColor5,
                         fontSize: 16.sp,
                         fontWeight: FontWeight.bold,
                       ),


                       textAlign: TextAlign.center,
                     ),
                     onTap:
                         (){
                     userData.write('isLogged', false);
                     userData.remove('email');
                     userData.remove('password');
                     Get.offAll(SignInScreen());

                     },

                   ),

                 ],
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
