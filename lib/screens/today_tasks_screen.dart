import 'package:alamir_app/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:ui' as ui;

  import '../models/another+dates_model.dart';
import '../models/mission_model.dart';

class TodayTasksScreen extends StatefulWidget {
  const TodayTasksScreen({super.key});

  @override
  State<TodayTasksScreen> createState() => _TodayTasksScreenState();
}

class _TodayTasksScreenState extends State<TodayTasksScreen> {


  Future<Mission> getData() async {
    final response = await http.get(
        Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetAllMissions'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // print(data['Records']);
      return Mission.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
   @override
  Widget build(BuildContext context) {
    return   Directionality(
      textDirection: ui.TextDirection.rtl,

      child: Scaffold(
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

                      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 30.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            'المهام والمواعيد اليومية',
                            style: TextStyle(
                              color: Styles.defaultColor2,
                              fontSize: 23.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding:   EdgeInsets.symmetric(horizontal: 15.h, vertical: 90.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'اليوم',
                                style: TextStyle(
                                  color: Styles.defaultColor10,
                                  fontSize: 20.sp,
                                ),
                              ),
                              Gap(5.h),
                              Text(
                                DateFormat ('yyyy-MM-dd').format(DateTime.now()),
                                style: TextStyle(
                                    color: Styles.defaultColor8,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                     Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 150.h, right: 10.h, left: 10.h),
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
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                    ),

                                    child:  Column(
                                      children: [
                                        DataTable(
                                            dataRowHeight: 45.h,
                                            headingRowHeight:35.h,
                                            horizontalMargin: 10.h,



                                            dataRowColor:
                                            MaterialStateProperty.all(Colors.white),
                                            columnSpacing:29.h,
                                            border: TableBorder(
                                                horizontalInside: BorderSide(color: Colors.grey.shade50,width: .5),
                                                verticalInside: BorderSide(color: Styles.defaultColor2)
                                            ),
                                            columns:   [




                                              DataColumn(
                                                  label: Text(
                                                    'الإسم',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10.sp,
                                                        fontWeight: FontWeight.bold),

                                                  )),
                                              DataColumn(
                                                  label: Text(
                                                    'المكان',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10.sp,
                                                        fontWeight: FontWeight.bold),

                                                  )),
                                              DataColumn(
                                                  label: Text(
                                                    'التاريخ',

                                                    textAlign: TextAlign.center,

                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10.sp,
                                                        fontWeight: FontWeight.bold),

                                                  )),
                                              DataColumn(
                                                  label: Text(
                                                    'التفاصيل',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10.sp,
                                                        fontWeight: FontWeight.bold),
                                                  )
                                              ),





                                            ],
                                            rows:  List.generate(snapshot.data!.records!.length , (index) => DataRow(
                                                color:MaterialStateProperty.all(Colors.white),


                                                cells: [




                                                  DataCell(Text(
                                                    '${snapshot.data!.records![index].employees!.name}',
                                                    maxLines: 2,softWrap: false,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle( fontSize: 8.sp,
                                                      height: 1.h,
                                                    ),
                                                  )),
                                                  DataCell(Text(
                                                    '${snapshot.data!.records![index].place}',maxLines: 2,softWrap: false,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle( fontSize: 8.sp,  height: 1.h,),
                                                  )),
                                                  DataCell(Text(
                                                    '${DateFormat('yyyy-MM-dd').format(DateTime.parse('${snapshot.data!.records![index].missionDate}'))}' ,
                                                    style: TextStyle( fontSize: 8.sp,  height: 1.h,),
                                                  )),
                                                  DataCell(Text(
                                                    '${snapshot.data!.records![index].missionDetails}',maxLines: 2,softWrap: false,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle( fontSize: 8.sp,  height: 1.h,),


                                                  )),




                                                ]

                                            ),)


                                        ),
                                      ],
                                    )
                                  );
                                }else {
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
