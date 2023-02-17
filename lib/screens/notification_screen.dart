import 'package:alamir_app/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
 import 'dart:convert';
import 'dart:ui' as ui;
import '../models/Alert_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Future<NotificationModel> getData() async {
  //   final response = await http.get(
  //       Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetAllNotification'));
  //   var data = jsonDecode(response.body.toString());
  //
  //   if (data['iSuccssed']==true) {
  //
  //     print(response.body.length);
  //     return NotificationModel.fromJson(jsonDecode(response.body));
  //   } else {
  //
  //     throw Exception('Failed to load album');
  //   }
  // }
  Future<NotificationModel> getDataAlert() async {
    final response = await http.get(
        Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetAllNotification'));
    var data = jsonDecode(response.body.toString());

    if (data['iSuccssed']==true) {

      print(response.body);
      return NotificationModel.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to load album');
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
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
                      'الإشعارات',
                      style: TextStyle(
                        color: Styles.defaultColor2,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                      },
                      child: FutureBuilder(
                        future: getDataAlert(),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return  Icon(
                              Icons.notifications_none_outlined,
                              color: Styles.defaultColor6,
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
                              color: Styles.defaultColor6,
                            );
                          }
                        },

                      ),
                    ),

                  ],
                ),
              ),
              FutureBuilder(
                future: getDataAlert(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 100.h, right: 20, left: 20),
                        child: SingleChildScrollView(
                          child:     Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Container(

                                width: double.infinity,
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
                                    ),], //Bo
                                  color: Styles.defaultColor12,
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                ),

                                child: Column(
                                  children: [
                                    DataTable(
                                        dataRowHeight: 45.h,
                                        headingRowHeight:40.h,



                                        dataRowColor: MaterialStateProperty.all(Colors.white),
                                        columnSpacing:96.5.h,
                                        border: TableBorder(
                                            horizontalInside: BorderSide(color: Colors.grey.shade50,width: .5.r),
                                            verticalInside: BorderSide(color: Styles.defaultColor2)
                                        ),
                                        columns:   [


                                          DataColumn(
                                              label: Center(
                                                child: Text(
                                                  ' تاريخ المستشفيات',



                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.bold),

                                                ),
                                              )),
                                          DataColumn(
                                              label: Center(
                                                child: Text(
                                                  ' تفاصيل المستشفيات',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              )
                                          ),

                                        ],
                                        rows:  List.generate(snapshot.data!.hosipitalRecords.length , (index) => DataRow(


                                            cells: [
                                              DataCell(Text(
                                                '${DateFormat('yyyy-MM-dd  HH-mm-ss').format(DateTime.parse('${snapshot.data!.hosipitalRecords[index].dateTime}') )}',
                                                style: TextStyle( fontSize: 9.sp),
                                              )),
                                              DataCell(Text(
                                                '${snapshot.data!.hosipitalRecords[index].dateDetails}',
                                                style: TextStyle( fontSize: 9.sp),
                                              )),]))



                                    ),







                                  ],
                                ),
                              ),
                              Gap(15.h),
                              Container(

                                width: double.infinity,
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
                                    ),], //Bo
                                  color: Styles.defaultColor12,
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10.r),topLeft: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                ),

                                child: Column(
                                  children: [
                                    DataTable(
                                        dataRowHeight: 30.h,
                                        headingRowHeight:40.h,



                                        dataRowColor:
                                        MaterialStateProperty.all(Colors.white),
                                        columnSpacing:103.h,
                                        border: TableBorder(
                                            horizontalInside: BorderSide(color: Colors.grey.shade50,width: .5.r),
                                            verticalInside: BorderSide(color: Styles.defaultColor2)
                                        ),
                                        columns:   [


                                          DataColumn(
                                              label: Center(
                                                child: Text(
                                                  ' تاريخ مواعيد أخري',



                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.bold),

                                                ),
                                              )),
                                          DataColumn(
                                              label: Center(
                                                child: Text(
                                                  ' تفاصيل مواعيد أخري',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              )
                                          ),

                                        ],
                                        rows:  List.generate(snapshot.data!.datesRecords.length , (index) => DataRow(


                                            cells: [

                                              DataCell(Text(
                                                '${DateFormat('yyyy-MM-dd  HH-mm-ss').format(DateTime.parse('${snapshot.data!.datesRecords[index].dateTime}')) }',
                                                style: TextStyle( fontSize: 9.sp),
                                              )),
                                              DataCell(Text(
                                                '${snapshot.data!.datesRecords[index].dateDetails}',
                                                style: TextStyle( fontSize: 9.sp),
                                              )),]))

                                    ),







                                  ],
                                ),
                              ),
                              Gap(15.h),
                              Container(

                                width: double.infinity,
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
                                    ),], //Bo
                                  color: Styles.defaultColor12,
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                ),

                                child: Column(
                                  children: [
                                    DataTable(
                                        dataRowHeight: 30.h,
                                        headingRowHeight:40.h,



                                        dataRowColor:
                                        MaterialStateProperty.all(Colors.white),
                                        columnSpacing:122.h,
                                        border: TableBorder(
                                            horizontalInside: BorderSide(color: Colors.grey.shade50,width: .5.r),
                                            verticalInside: BorderSide(color: Styles.defaultColor2)
                                        ),
                                        columns:   [


                                          DataColumn(
                                              label: Center(
                                                child: Text(
                                                  ' تاريخ فحص السيارة',



                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.bold),

                                                ),
                                              )),
                                          DataColumn(
                                              label: Center(
                                                child: Text(
                                                  ' رقم السيارة',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              )
                                          ),

                                        ],
                                        rows:  List.generate(snapshot.data!.carsRecords.length , (index) => DataRow(


                                            cells: [
                                              DataCell(Text(
                                                '${DateFormat('yyyy-MM-dd  HH-mm-ss').format(DateTime.parse('${snapshot.data!.carsRecords[index].maintenanceTime }'))}',
                                                style: TextStyle( fontSize: 9.sp),
                                              )),
                                              DataCell(Text(
                                                '${snapshot.data!.carsRecords[index].carNumbers}',
                                                style: TextStyle( fontSize: 9.sp),
                                              )),]))

                                    ),







                                  ],
                                ),
                              ),
                              Gap(15.h),
                            ],
                          ),
                        ),

                      ),
                    );
                  }
                  else {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 100.h, right: 20, left: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 50.h,
                                  width: double.infinity,
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
                                      ),], //Bo
                                    color: Styles.defaultColor5,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                  ),

                                  child:  Center(
                                    child: Text(
                                      ' لا يوجد إشعار اليوم !',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Styles.defaultColor2
                                      ),

                                    ),
                                  )
                              ),


                            ],
                          ),
                        ),
                      ),
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
