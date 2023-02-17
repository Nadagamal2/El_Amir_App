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
import '../models/another+dates_model.dart';
import 'Alerts_screen.dart';
import 'notification_screen.dart';

class AnotherScreen extends StatefulWidget {
  const AnotherScreen({Key? key}) : super(key: key);

  @override
  State<AnotherScreen> createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  Future<Another_Dates> getData() async {
    final response = await http.get(
        Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetAllDates'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // print(data['Records']);
      return Another_Dates.fromJson(jsonDecode(response.body));
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
                            'مواعيد أخرى',
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
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 100.h, right: 10.h, left: 10.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FutureBuilder(
                              future: getData(),
                               builder: (context,snapshot){
                                if(snapshot.hasData){
                                  return Container(
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
                                            dataRowHeight: 50.h,
                                            headingRowHeight:40.h,
                                            horizontalMargin: 10.h,



                                            dataRowColor:
                                            MaterialStateProperty.all(Colors.white),
                                            columnSpacing:21.8.h,
                                            border: TableBorder(
                                                horizontalInside: BorderSide(color: Colors.grey.shade50,width: .5.r),
                                                verticalInside: BorderSide(color: Styles.defaultColor2)
                                            ),
                                            columns:   [


                                              DataColumn(
                                                  label: Center(
                                                    child: Text(
                                                      'الإسم',



                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11.sp,
                                                          fontWeight: FontWeight.bold),

                                                    ),
                                                  )),
                                              DataColumn(
                                                  label: Center(
                                                    child: Text(
                                                      'المكان',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11.sp,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  )
                                              ),
                                              DataColumn(
                                                  label: Center(
                                                    child: Text(
                                                      'التاريخ',



                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11.sp,
                                                          fontWeight: FontWeight.bold),

                                                    ),
                                                  )),
                                              DataColumn(
                                                  label: Center(
                                                    child: Text(
                                                      'التفاصيل',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11.sp,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  )
                                              ),

                                            ],
                                            rows:  List.generate(snapshot.data!.records!.length , (index) =>  DataRow(
                                                color:MaterialStateProperty.all(Colors.white),


                                                cells: [


                                                  DataCell(Text(
                                                      '${snapshot.data!.records![index].name}',
                                                    maxLines: 2,softWrap: false,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle( fontSize: 8.5.sp,),
                                                  )),
                                                  DataCell(Text(
                                                    '${snapshot.data!.records![index].place}',
                                                    maxLines: 3,softWrap: false,
                                                    overflow: TextOverflow.ellipsis,

                                                    style: TextStyle(
                                                      fontSize:8.sp,
                                                    ),
                                                  )),
                                                  DataCell(Text(
                                                    '${DateFormat('yyyy-MM-dd').format(DateTime.parse('${snapshot.data!.records![index].dateTime}'))}' ,
                                                    style: TextStyle( fontSize: 8.5.sp,),
                                                  )),
                                                  DataCell(Text(
                                                    '${snapshot.data!.records![index].dateDetails}',
                                                    maxLines: 2,softWrap: false,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 8.5.sp,

                                                    ),
                                                  )),
                                                ]

                                            ),)


                                        ),





                                      ],
                                    ),
                                  );
                                }  else {
                                  return Center(
                                    child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defaultColor2),),
                                  );
                                }
                               },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
        }


}
