import 'package:alamir_app/app_style.dart';
import 'package:alamir_app/models/cars_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:toggle_switch/toggle_switch.dart';

import '../models/Alert_model.dart';
import 'Alerts_screen.dart';
import 'notification_screen.dart';

class CarScreen extends StatefulWidget {
  const CarScreen({Key? key}) : super(key: key);

  @override
  State<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  // List<bool> isSelected = [ true,false,false];
  int counter = 0;
  int counter1 = 0;


  CarouselController buttonCarouselController = CarouselController();




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

      //print(response.body.length);
      return NotificationModel.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to load album');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,

      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {

          if (snapshot.hasData) {



            return Scaffold(
              backgroundColor: Styles.defaultColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 27.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'السيارات',
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
                                  return Icon(
                                    Icons.notifications_none_outlined,
                                    color: Colors.white,
                                  );
                                  //   Stack(
                                  //   children: [
                                  //     Icon(
                                  //       Icons.notifications_none_outlined,
                                  //       color: Colors.white,
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
                                    color: Colors.white,
                                  );
                                }
                              },

                            ),
                          ),
                        ],

                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 850.h,

                          autoPlay: false,
                          viewportFraction: .85.h,
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
                        items:  snapshot.data!.records!.map((e) => Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.h),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        'http://eibtekone-001-site3.atempurl.com${e.carImgUrl}',
                                      ),
                                    ),
                                  ),
                                  height: 175.h,
                                  width: double.infinity.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for(int i=0;i<snapshot.data!.records!.length;i++)
                                      Container(
                                        height: 12.h,
                                        width: 12.h,
                                        margin: EdgeInsets.symmetric(horizontal: 5.h,vertical: 10.h),
                                        decoration: BoxDecoration(
                                          color: i==counter1?Styles.defaultColor2:Styles.defaultColor5,
                                          shape: BoxShape.circle,

                                        ),
                                      ),
                                  ],
                                )
                              ],
                            ),
                             Gap(15.h),
                             Text('${e.carModel}',style: TextStyle(color: Styles.defaultColor5,fontSize: 18.sp,fontWeight: FontWeight.bold),),
                            Gap(15.h),
                             Center(
                          child: Padding(
                            padding: EdgeInsets.only(right: 20.h, left: 20.h),
                            child: Column(
                              children: [

                                Container(
                                  padding: EdgeInsets.only(right: 10.h, left: 10.h),
                                  height: 220.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Styles.defaultColor5,
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  child: counter==0?
                                  Padding(
                                    padding:   EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Column(
                                          children: [
                                            if(counter1<=snapshot.data!.records!.length-1)
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Text('نوع السيارة',style: TextStyle(color: Styles.defaultColor,fontSize: 15.sp),),
                                                      Gap(10.h),
                                                      Text('${e.carModel}',style: TextStyle(color: Styles.defaultColor8,fontSize: 12.sp),),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,

                                                    children: [
                                                      Text('تأمين السيارة',style: TextStyle(color: Styles.defaultColor,fontSize: 15.sp),),
                                                      Gap(10.h),
                                                      Text('${e.carColor}',style: TextStyle(color: Styles.defaultColor8,fontSize: 12.sp),),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            Divider(
                                              height: 50.h,
                                              color: Styles.defaultColor7,
                                              thickness: .1,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,

                                                  children: [
                                                    Text('رقم السيارة',style: TextStyle(color: Styles.defaultColor,fontSize: 15.sp),),
                                                    Gap(10.h),
                                                    Text('${e.carNumbers}',style: TextStyle(color: Styles.defaultColor8,fontSize: 12.sp),),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,

                                                  children: [
                                                    Text('وقت الصيانة',style: TextStyle(color: Styles.defaultColor,fontSize: 15.sp),),
                                                    Gap(10.h),
                                                    Text( '${DateFormat('yyyy-MM-dd  HH-mm-ss').format(DateTime.parse( '${e.maintenanceTime}'))}' ,

                                                      style: TextStyle(
                                                        color: Styles.defaultColor8,
                                                          fontSize: 12.sp
                                                      ),),

                                                  ]
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),


                                      ],
                                    ),
                                  ):
                                  counter==1?
                                  InteractiveViewer(
                                    clipBehavior: Clip.none,
                                    child: Image(
                                    image: NetworkImage(
                                    'http://eibtekone-001-site3.atempurl.com${e.insurancesImgUrl}',
                                    ),
                                    fit: BoxFit.cover,
                                      height: 100.h,
                                      width: double.infinity.h,
                                    ),
                                  ):
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Text('${e.maintenanceTime}',style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Styles.defaultColor,
                                          fontWeight: FontWeight.w600

                                      ),)



                                    ],
                                  ),
                                ),


                                Gap(15.h),
                                Text('رخصه السيارة',style: TextStyle(color: Styles.defaultColor5,fontSize: 18.sp,fontWeight: FontWeight.bold),),

                                Gap(15.h),
                                Container(
                                  padding: EdgeInsets.all(10.h),
                                  height: 220.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Styles.defaultColor5,
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  child:   InkWell(
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
                                                              'http://eibtekone-001-site3.atempurl.com${e.licenseImgUrl}',
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
                                              'http://eibtekone-001-site3.atempurl.com${e.licenseImgUrl}',
                                            ),
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                          ],
                        )).toList(),
                        carouselController: buttonCarouselController,
                      ),
                    ),

                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defaultColor2),),
            );
          }
        },
      ),
    );
  }
}
//Container(
//                           margin: EdgeInsets.symmetric(horizontal: 5.h),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20.h),
//                             image: DecorationImage(
//                               image: NetworkImage(
//                                 'http://eibtekone-001-site3.atempurl.com${snapshot.data!.records![0].carImgUrl}',
//                               ),
//                             ),
//                           ),
//                           height: 50,
//
//                         ),

