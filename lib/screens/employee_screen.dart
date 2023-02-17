import 'package:alamir_app/app_style.dart';
import 'package:alamir_app/models/Alert_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:ui' as ui;
import '../models/employee_model.dart';
import 'Alerts_screen.dart';
import 'notification_screen.dart';


class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  int counter1=0;

  Future<Employee> getData() async {
    final response = await http.get(
        Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetAllEmployees'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // print(data['Records']);
      return Employee.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  Future<NotificationModel> getDataAlert() async {
    final response = await http.get(
        Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetAllNotification'));
    var data = jsonDecode(response.body.toString());

    if (data['iSuccssed']==true) {

      print(response.body.length);
      return NotificationModel.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return   Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold (
              backgroundColor: Styles.defaultColor6,
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 670.h,
                      child: Stack(
                        children: [
                          Positioned(
                            top: -150.h,
                            right: 20.h,
                            child: Image(
                                fit: BoxFit.cover,
                                width: 270.h,
                                image: AssetImage(
                                  'assets/g14.png',
                                )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 27.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap:(){
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'الموظفين',
                            style: TextStyle(
                              color: Styles.defaultColor2,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: (){  Get.to(NotificationScreen());
                             },
                            child: FutureBuilder(
                              future: getDataAlert(),
                              builder: (context,snapshot){
                                if(snapshot.hasData){
                                  return  Icon(
                                    Icons.notifications_none_outlined,
                                    color: Colors.black,
                                  );
                                  //   Stack(
                                  //   children: [
                                  //     Icon(
                                  //       Icons.notifications_none_outlined,
                                  //       color: Colors.black,
                                  //     ),
                                  //     CircleAvatar(
                                  //       backgroundColor: Colors.red,
                                  //       radius: 5.5.r,
                                  //       child: Text(
                                  //         '${snapshot.data!.count}',
                                  //         style: TextStyle(color: Colors.white,fontSize: 8.sp),
                                  //       ),
                                  //     )
                                  //   ],
                                  // );
                                }else {
                                  return  Icon(
                                    Icons.notifications_none_outlined,
                                    color: Colors.black,
                                  );
                                }
                              },

                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder(
                      future: getData(),
                      builder: (context,snapshot){
                        if(snapshot.hasData){
                          return  Container(
                            height: 700.h,
                            padding: EdgeInsets.only(top: 80.h, ),
                            child:
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 1000.h,


                                autoPlay: false,
                                viewportFraction: .9.h,

                                onPageChanged: (index, reason) {
                                  setState(() {
                                    counter1=index;

                                  });
                                },
                                enlargeCenterPage: true,

                                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                                pauseAutoPlayOnTouch: true,
                                //enableInfiniteScroll: true,
                                autoPlayAnimationDuration: Duration(milliseconds: 900),
                                //  viewportFraction: .8,
                              ),
                              items:  snapshot.data!.records!.map((e) =>   Column(
                                children: [
                                  Padding(
                                    padding:   EdgeInsets.only(right:20.h,left: 20.h),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 20.h),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade400,
                                            offset: const Offset(
                                              1.0,
                                              1.0,
                                            ),
                                            blurRadius: 5.0,
                                            spreadRadius: .5,
                                          ),
                                        ], //Bo
                                        color: Styles.defaultColor5,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10.r),
                                            bottomRight: Radius.circular(10.r)),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        children: [

                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text('صورة الموظف',style: TextStyle(
                                                    color: Styles.defaultColor10,
                                                    fontSize: 15.sp,

                                                  ),),
                                                  Gap(5.h),
                                                  CircleAvatar(
                                                    radius: 55.r,

                                                    backgroundImage:  NetworkImage(
                                                      'http://eibtekone-001-site3.atempurl.com${e.employeeImgUrl}',
                                                    ),

                                                  ),
                                                ],
                                              ),
                                              Gap(15.h),
                                              Divider(
                                                height: 20.h,
                                                color: Styles.defaultColor7,
                                                thickness: .1,
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text('صورة الإقامة',style: TextStyle(
                                                    color: Styles.defaultColor10,
                                                    fontSize: 15.sp,

                                                  ),),
                                                  Gap(5.h),
                                                  InkWell(
                                                    onTap: (){
                                                      showDialog(
                                                        context: context,
                                                        builder:(context)=>
                                                            Dialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(0)),

                                                              child: Container(
                                                                height: 180.h,
                                                                width: 250.h,

                                                                child: InteractiveViewer(

                                                                    clipBehavior: Clip.none,
                                                                    child: Container(
                                                                      width: double.infinity,


                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(

                                                                            image:  NetworkImage(
                                                                              'http://eibtekone-001-site3.atempurl.com${e.signatureImgUrl}',
                                                                            ),
                                                                          )
                                                                      ),
                                                                    )
                                                                ),
                                                              ),

                                                            ),

                                                      );
                                                    },
                                                    child:  Container(
                                                      height: 180.h,

                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5.r),
                                                          image: DecorationImage(

                                                            image:  NetworkImage(
                                                              'http://eibtekone-001-site3.atempurl.com${e.signatureImgUrl}',
                                                            ),
                                                          )
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),

                                            ],

                                          ),
                                          Gap(10.h),
                                          Divider(
                                            height: 20.h,
                                            color: Styles.defaultColor7,
                                            thickness: .1,
                                          ),
                                          Gap(10.h),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 3.h,
                                                    height: 85.h,



                                                    decoration: BoxDecoration(
                                                      color:Styles.defaultColor,
                                                      borderRadius: BorderRadius.circular(5.r),
                                                    ),
                                                  ),
                                                  Gap(10.h),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,

                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text('الإسم',style: TextStyle(
                                                            color: Styles.defaultColor10,
                                                            fontSize: 12.sp,

                                                          ),),
                                                          Text('${e.name}',style: TextStyle(
                                                            color: Styles.defaultColor8,
                                                            fontSize: 10.sp,

                                                          ),),

                                                        ],
                                                      ),
                                                      Gap(10.h),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        crossAxisAlignment: CrossAxisAlignment.start,

                                                        children: [
                                                          Text('المهنة',style: TextStyle(
                                                            color: Styles.defaultColor10,
                                                            fontSize: 12.sp,

                                                          ),),
                                                          Text('${e.position}',
                                                            maxLines: 1,softWrap: false,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                            color: Styles.defaultColor8,
                                                            fontSize: 10.sp,

                                                          ),),

                                                        ],
                                                      ),

                                                    ],
                                                  ),


                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,

                                                    children: [

                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        crossAxisAlignment: CrossAxisAlignment.end,

                                                        children: [
                                                          Text('رقم الإقامة',style: TextStyle(
                                                            color: Styles.defaultColor10,
                                                            fontSize: 12.sp,

                                                          ),),
                                                          Text('${e.residencyUmber}',style: TextStyle(
                                                            color: Styles.defaultColor8,
                                                            fontSize: 10.sp,

                                                          ),),

                                                        ],
                                                      ),
                                                      Gap(10.h),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text('تاريخ انتهاء الإقامة',style: TextStyle(
                                                            color: Styles.defaultColor10,
                                                            fontSize: 12.sp,

                                                          ),),
                                                          Text( '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${e.residExpDate}'))}' ,

                                                            style: TextStyle(
                                                              color: Styles.defaultColor8,
                                                              fontSize: 10.sp,

                                                            ),),
                                                        ],
                                                      ),
                                                    ],
                                                  ),




                                                ],
                                              ),
                                            ],
                                          ),







                                          //   Column(
                                          //                                         crossAxisAlignment: CrossAxisAlignment.center,
                                          //                                         mainAxisAlignment: MainAxisAlignment.center,
                                          //                                         children: [
                                          //                                           Row(
                                          //                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //                                             children: [
                                          //                                               Text('رقم الإقامة',style: TextStyle(
                                          //                                                 color: Styles.defaultColor10,
                                          //                                                 fontSize: 15.sp,
                                          //
                                          //                                               ),),
                                          //                                               Text('التوقيع',style: TextStyle(
                                          //                                                 color: Styles.defaultColor10,
                                          //                                                 fontSize: 15.sp,
                                          //
                                          //                                               ),),
                                          //                                             ],
                                          //                                           ),
                                          //                                           Gap(10.h),
                                          //                                           Row(
                                          //                                             crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //                                             children: [
                                          //                                               Text('${snapshot.data!.records![index].residencyUmber}',style: TextStyle(
                                          //                                                 color: Styles.defaultColor8,
                                          //                                                 fontSize: 13.sp,
                                          //
                                          //                                               ),),
                                          //                                               Text('${snapshot.data!.records![index].signature}',style: TextStyle(
                                          //                                                 color: Styles.defaultColor8,
                                          //                                                 fontSize: 13.sp,
                                          //
                                          //                                               ),),
                                          //                                             ],
                                          //                                           ),
                                          //                                         ],
                                          //                                       ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Gap(30.h),
                                ],
                              ),).toList(),
                            ),

                          );
                        }else
                        {
                          return Center(
                            child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defaultColor2),),
                          );
                        }
                      },
                    )

                  ],
                ),
              ),
            ),
    );
        }

}
