import 'package:alamir_app/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui' as ui;
import '../models/Alert_model.dart';
import '../models/cars_model.dart';
import '../models/identity_model.dart';
import 'Alerts_screen.dart';


class CarDocumentScreen extends StatefulWidget {
  const CarDocumentScreen({Key? key}) : super(key: key);

  @override
  State<CarDocumentScreen> createState() => _CarDocumentScreenState();
}

class _CarDocumentScreenState extends State<CarDocumentScreen> {
  Future<Cars> getData() async {
    final response = await http.get(
        Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetAllCars'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // print(data['Records']);
      return Cars.fromJson(jsonDecode(response.body));
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
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'الوثائق',
                            style: TextStyle(
                              color: Styles.defaultColor2,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(AlertsScreen());
                            },
                            child: FutureBuilder(
                              future: getDataAlert(),
                              builder: (context,snapshot){
                                if(snapshot.hasData){
                                  return Stack(
                                    children: [
                                      Icon(
                                        Icons.notifications_none_outlined,
                                        color: Colors.black,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.red,
                                        radius: 5.5.r,
                                        child: Text(
                                          '${snapshot.data!.count}',
                                          style: TextStyle(color: Colors.white,fontSize: 8.sp),
                                        ),
                                      )
                                    ],
                                  );
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
                        padding: EdgeInsets.only(top: 100.h, right: 40, left: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FutureBuilder(
                              future: getData(),
                              builder: (context,snapshot){
                                if(snapshot.hasData){
                                  return Column(
                                    children: [
                                      Container(
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
                                          color: Styles.defaultColor12,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10.r),
                                              bottomRight: Radius.circular(10.r)),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 200.h,
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.h),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(10.r),
                                                    bottomRight: Radius.circular(10.r),
                                                    topLeft: Radius.circular(10.r),
                                                    topRight: Radius.circular(10.r),
                                                  )),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  InteractiveViewer(
                                                    clipBehavior: Clip.none,
                                                    child: Image(

                                                      image:   NetworkImage(
                                                        'http://eibtekone-001-site3.atempurl.com${snapshot.data!.records![0].licenseImgUrl}',
                                                      ),
                                                      fit: BoxFit.cover,
                                                      height: 180.h,
                                                      width: double.infinity

                                                    ),
                                                  ),






                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Gap(25.h),
                                      Container(
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
                                          color: Styles.defaultColor12,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10.r),
                                              bottomRight: Radius.circular(10.r)),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 200.h,
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.h),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(10.r),
                                                    bottomRight: Radius.circular(10.r),
                                                    topLeft: Radius.circular(10.r),
                                                    topRight: Radius.circular(10.r),
                                                  )),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  InteractiveViewer(
                                                    clipBehavior: Clip.none,
                                                    child: Image(

                                                      image:   NetworkImage(
                                                        'http://eibtekone-001-site3.atempurl.com${snapshot.data!.records![0].insurancesImgUrl}',
                                                      ),
                                                      fit: BoxFit.cover,
                                                      height: 180.h,
                                                      width: double.infinity,

                                                    ),
                                                  ),






                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                    ],
                                  );
                                } else {
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
//Container(
//                                     height: 350.h,
//                                     width: 250,
//                                     padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 20.h),
//
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.grey.shade400,
//                                           offset: const Offset(
//                                             1.0,
//                                             1.0,
//                                           ),
//                                           blurRadius: 5.0,
//                                           spreadRadius: .5,
//                                         ),
//                                       ], //Bo
//                                        borderRadius: BorderRadius.only(
//                                           topRight: Radius.circular(10),
//                                           topLeft: Radius.circular(10),
//                                           bottomLeft: Radius.circular(10.r),
//                                           bottomRight: Radius.circular(10.r)),
//                                     ),
//                                     child: Column(
//                                       children: [
//                                         Column(
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: [
//                                             Container(
//
//
//                                               height:150.h,
//                                               width: 160.h,
//
//                                               child: Image(
//                                                 fit: BoxFit.cover,
//                                                 image:   NetworkImage(
//                                                   'http://eibtekone-001-site3.atempurl.com${snapshot.data!.records![0].licenseImgUrl}',
//                                                 ),
//                                               ),
//
//                                             ),
//                                             Gap(10.h),
//                                             Container(
//
//
//                                               height:150.h,
//                                               width: 160.h,
//
//                                               child: Image(
//                                                 fit: BoxFit.cover,
//                                                 image:   NetworkImage(
//                                                   'http://eibtekone-001-site3.atempurl.com${snapshot.data!.records![0].insurancesImgUrl}',
//                                                 ),
//                                               ),
//
//                                             ),
//
//
//
//
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   );