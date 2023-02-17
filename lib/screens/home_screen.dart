import 'package:alamir_app/app_style.dart';
import 'package:alamir_app/screens/account_details_screen.dart';
 import 'package:alamir_app/screens/dates_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import '../component/home_component.dart';
import '../models/Alert_model.dart';
import 'Alerts_screen.dart';
import 'car_screen.dart';
import 'decument_details_screen.dart';
import 'employ_details_screen.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'employee_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOpen=true;
  Future<NotificationModel> getData() async {
    final response = await http.get(
        Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetAllNotification'));
    var data = jsonDecode(response.body.toString());

    if (data['iSuccssed']==true) {


      return NotificationModel.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {
    return    Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
              backgroundColor: Styles.defaultColor6,
              body: SingleChildScrollView(
                child: Stack(
                  children: [

                    Stack(
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

                        Image(
                          image: AssetImage('assets/a.png'),
                        ),
                        Column(
                          children: [
                            Gap(180.h),
                            HomeComponent(
                              onTap2: (){
                                Get.to(const DocumentDetailsScreen());
                              },
                              onTap1: (){
                                Get.to(const AccountDetailsScreen());
                              },
                              text1: 'الحسابات',
                              image1: Image(
                                image: const AssetImage(
                                  'assets/Icon material-account-box.png',
                                ),
                                fit: BoxFit.cover,
                                height: 40.h,
                                width: 40.h,
                              ),
                              text2: 'الوثائق',
                              image2: Image(
                                image: AssetImage(
                                  'assets/Icon awesome-passport.png',
                                ),
                                fit: BoxFit.cover,
                                height: 40.h,
                                width: 40.h,
                              ),
                            ),


                            Gap(10.h),
                            HomeComponent(
                              onTap1: (){
                                Get.to(const CarScreen());
                              },
                              onTap2: (){
                                Get.to(const EmployeeScreen());
                              },
                              text1: 'السيارات',
                              image1: Image(
                                image: AssetImage(
                                  'assets/Icon awesome-car.png',
                                ),
                                fit: BoxFit.cover,
                                height: 35.h,
                                width: 50.h,
                              ),
                              text2:'الموظفين',
                              image2: Image(
                                image: AssetImage(
                                  'assets/Icon material-people.png',
                                ),
                                fit: BoxFit.cover,
                                height: 34.h,
                                width: 53.h,
                              ),
                            ),

                            Gap(10.h),
                            HomeComponent(
                              onTap1: (){
                                Get.to(AlertsScreen());
                              },
                              onTap2: (){
                                Get.to(const DatesDetailsScreen());
                              },
                              text1: 'المناسبات',
                              image1: Image(
                                image: AssetImage(
                                  'assets/Icon ionic-ios-alarm.png',
                                ),
                                fit: BoxFit.cover,
                                height: 45.h,
                                width: 45.h,
                              ),
                              text2: 'المواعيد',
                              image2: Image(
                                image: AssetImage(
                                  'assets/Icon awesome-calendar-check.png',
                                ),
                                fit: BoxFit.cover,
                                height: 45.h,
                                width: 40.h,
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(NotificationScreen());
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 35.h),
                          child: FutureBuilder(
                            future: getData(),
                            builder: (context,snapshot){
                              if(snapshot.hasData){
                                return  Icon(
                                  Icons.notifications_none_outlined,
                                  color: Colors.black,
                                  size: 28.sp,
                                );
                              //   Stack(
                              //       children: [
                              //       Icon(
                              //       Icons.notifications_none_outlined,
                              //       size: 28.sp,
                              //       color: Colors.black,
                              //   ),
                              // CircleAvatar(
                              // backgroundColor: Colors.red,
                              // radius: 5.5.r,
                              // child: Text(
                              // '${snapshot.data!.count}',
                              // style: TextStyle(color: Colors.white,fontSize: 8.sp),
                              // ),
                              // )
                              // ],
                              // );
                              }else {
                                return  Icon(
                                  Icons.notifications_none_outlined,
                                  color: Colors.black,
                                  size: 28.sp,
                                );
                              }
                            },

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
        }

}
