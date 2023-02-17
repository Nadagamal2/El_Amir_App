import 'package:alamir_app/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import '../models/Alert_model.dart';
import '../models/Masrofat_model.dart';
import '../models/another_masaref_model.dart';
import 'dart:ui' as ui;

import 'Alerts_screen.dart';
import 'notification_screen.dart';

class AnotherMasarefScreen extends StatefulWidget {
  const AnotherMasarefScreen({Key? key}) : super(key: key);

  @override
  State<AnotherMasarefScreen> createState() => _AnotherMasarefScreenState();
}

class _AnotherMasarefScreenState extends State<AnotherMasarefScreen> {
  Future<Another_masafef> getData() async {
    final response = await http.get(
        Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetAllOtherExpenses'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // print(data['Records']);
      return Another_masafef.fromJson(jsonDecode(response.body));
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
                      height: 680.h,
                      width: double.infinity,
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
                            'مصاريف اخري',
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
                        padding: EdgeInsets.only(top: 100.h, right: 10, left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FutureBuilder(
                              future: getData(),
                              builder: (context,snapshot){
                                if(snapshot.hasData){
                                  return Container(
                                    width:double.infinity,
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
                                        SizedBox(


                                          child: DataTable(
                                              dataRowHeight: 50.h,
                                              headingRowHeight:35.h,
                                              horizontalMargin: 10.h,



                                              dataRowColor:
                                              MaterialStateProperty.all(Colors.white),
                                              columnSpacing:52.h,
                                              border: TableBorder(
                                                  horizontalInside: BorderSide(color: Colors.grey.shade50,width: .5),
                                                  verticalInside: BorderSide(color: Styles.defaultColor2)
                                              ),
                                              columns:   [
                                                DataColumn(
                                                    label: Text(
                                                      'تفاصيل',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10.sp,
                                                          fontWeight: FontWeight.bold),
                                                    )
                                                ),

                                                DataColumn(
                                                    label: Padding(
                                                      padding:   EdgeInsets.only(left: 25.h),
                                                      child: Text(
                                                        'التكلفة',

                                                        textAlign: TextAlign.center,

                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10.sp,
                                                            fontWeight: FontWeight.bold),

                                                      ),
                                                    )),
                                                DataColumn(
                                                    label: Text(
                                                      'التاريخ',


                                                      style: TextStyle(
                                                          color: Styles.defaultColor5,
                                                          fontSize: 10.sp,
                                                          fontWeight: FontWeight.bold),
                                                      textAlign: TextAlign.center,
                                                    )),

                                              ],
                                              rows:  List.generate(snapshot.data!.records!.length , (index) =>  DataRow(
                                                  color:MaterialStateProperty.all(Colors.white),


                                                  cells: [

                                                    DataCell(Text(
                                                      '${snapshot.data!.records![index].deatils}',
                                                      maxLines: 2,softWrap: false,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 8.5.sp,
                                                        height: 1.h,
                                                      ),
                                                    )),
                                                    DataCell(Center(
                                                      child: Text(
                                                        '${snapshot.data!.records![index].cost}',
                                                        style: TextStyle(
                                                          fontSize: 8.5.sp,
                                                          height: 1.h,
                                                        ),
                                                      ),
                                                    )),
                                                    DataCell(Text(
                                                      '${DateFormat('yyyy-MM-dd').format(DateTime.parse('${snapshot.data!.records![index].otherExpensesDate}'))}',
                                                      style: TextStyle(
                                                        fontSize: 8.5.sp,height: 1.h,
                                                      ),
                                                    )),

                                                  ]

                                              ),)


                                          ),
                                        ),




                                      ],
                                    ),
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

