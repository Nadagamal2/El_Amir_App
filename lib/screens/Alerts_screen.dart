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
import '../models/monsabat_model.dart';
import 'notification_screen.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({Key? key}) : super(key: key);

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
     Future<MonasabatModel> getData() async {
    final response = await http.get(
        Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetAllEvents'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {

       print(response.body.length);
      return MonasabatModel.fromJson(jsonDecode(response.body));
    } else {

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
                            'المناسبات',
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
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 100.h, right: 20, left: 20),
                              child: SingleChildScrollView(
                                child: SizedBox(
                                  height: 580.h,
                                  child: ListView.separated(
                                   itemCount: snapshot.data!.records.length,
                                    itemBuilder: (context,index)=>Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(

                                          width: double.infinity,
                                          padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.h),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
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
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10.r),
                                                bottomRight: Radius.circular(10.r),
                                                topLeft: Radius.circular(10.r),
                                                topRight: Radius.circular(10.r),
                                              )),
                                          child:  Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Text( '${DateFormat('yyyy-MM-dd  HH-mm-ss').format(DateTime.parse( '${snapshot.data!.records[index].eventDate}'))}' ,

                                                style: TextStyle(
                                                color: Styles.defaultColor8,
                                              ),),
                                              Divider(
                                                height: 20.h,
                                                color: Styles.defaultColor7,
                                                thickness: .1,
                                              ),
                                              Text('${snapshot.data!.records[index].eventDetails}',   style: TextStyle(
                                                color: Styles.defaultColor2,
                                              ),),
                                            ],
                                          ),

                                        ),

                                        Gap(15.h),
                                      ],
                                    ), separatorBuilder: (BuildContext context, int index) { return Gap(10.h); },

                                  ),
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
                                            ' لا توجد مناسبة اليوم !',
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
