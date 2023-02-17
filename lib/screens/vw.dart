//import 'package:alamir_app/app_style.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'dart:convert';
// import 'dart:ui' as ui;
// import '../models/Alert_model.dart';
// import '../models/Masrofat_model.dart';
// import 'Alerts_screen.dart';
//
// class MasarefScreen extends StatefulWidget {
//   const MasarefScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MasarefScreen> createState() => _MasarefScreenState();
// }
//
// class _MasarefScreenState extends State<MasarefScreen> {
//   List<String>day1=[
//     '2023/1/1',
//     '2023/2/1',
//     '2023/3/1',
//     '2023/4/1',
//     '2023/5/1',
//     '2023/6/1',
//     '2023/7/1',
//     '2023/8/1',
//     '2023/9/1',
//     '2023/10/1',
//     '2023/11/1',
//     '2023/12/1',
//     '2023/13/1',
//   ];
//   List<String>day2=[
//    '2023/1/31 ',
//    '2023/2/28 ',
//    '2023/3/31 ',
//    '2023/4/30 ',
//    '2023/5/31 ',
//    '2023/6/30 ',
//    '2023/7/31 ',
//    '2023/8/31 ',
//    '2023/9/30 ',
//    '2023/10/31 ',
//    '2023/11/30 ',
//    '2023/12/31 ',
//
//   ];
//   List<String>days=[
//     'يناير',
//     'فبراير',
//     'مارس',
//     'أبريل',
//     'مايو',
//     'يونيو',
//     'يوليو',
//     'أغسطس',
//     'سبتمبر',
//     'أكتوبر',
//     'نوفمبر',
//     'ديسمبر',
//
//
//
//   ];
//   int counter1=0;
//   int counter=0;
//   int counter2=0;
//   int counter3=0;
//
//   Future<Masrofat> getData() async {
//     final response = await http.get(
//         Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetYearCost'));
//     var data = jsonDecode(response.body.toString());
//
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       // print(data['Records']);
//       return Masrofat.fromJson(jsonDecode(response.body));
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load album');
//     }
//   }
//   Future<Alerts> getDataAlert() async {
//     final response = await http.get(
//         Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetAllNotification'));
//     var data = jsonDecode(response.body.toString());
//
//     if (data['iSuccssed']==true) {
//
//       print(response.body.length);
//       return Alerts.fromJson(jsonDecode(response.body));
//     } else {
//
//       throw Exception('Failed to load album');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return   Directionality(
//       textDirection: ui.TextDirection.rtl,
//       child: FutureBuilder(
//         future: getData(),
//        builder: (context,snapshot){
//           if(snapshot.hasData){
//             return Scaffold(
//               backgroundColor: Styles.defaultColor6,
//               body: SingleChildScrollView(
//                 child: Stack(
//                   children: [
//                     SizedBox(
//                       height: 670.h,
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             top: -150.h,
//                             right: 20.h,
//                             child: Image(
//                                 fit: BoxFit.cover,
//                                 width: 270.h,
//                                 image: AssetImage(
//                                   'assets/g14.png',
//                                 )),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 27.h),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                             onTap:(){
//                               Get.back();
//                             },
//                             child: const Icon(
//                               Icons.arrow_back_outlined,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Text(
//                             'المصاريف',
//                             style: TextStyle(
//                               color: Styles.defaultColor2,
//                               fontSize: 24.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           InkWell(
//                             onTap: (){
//                               Get.to(AlertsScreen());
//                             },
//                             child: FutureBuilder(
//                               future: getDataAlert(),
//                               builder: (context,snapshot){
//                                 if(snapshot.hasData){
//                                   return Stack(
//                                     children: [
//                                       Icon(
//                                         Icons.notifications_none_outlined,
//                                         color: Colors.black,
//                                       ),
//                                       CircleAvatar(
//                                         backgroundColor: Colors.red,
//                                         radius: 5.5.r,
//                                         child: Text(
//                                           '${snapshot.data!.count}',
//                                           style: TextStyle(color: Colors.white,fontSize: 8.sp),
//                                         ),
//                                       )
//                                     ],
//                                   );
//                                 }else {
//                                   return  Icon(
//                                     Icons.notifications_none_outlined,
//                                     color: Colors.black,
//                                   );
//                                 }
//                               },
//
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                  Stack(
//                    alignment: Alignment.center,
//                    children: [
//                      CarouselSlider(
//                        options: CarouselOptions(
//                          height: 650.h,
//                          viewportFraction: .9.h,
//
//                          // initialPage: snapshot.data!.records!.length==1?0:snapshot.data!.records!.length==2?1:snapshot.data!.records!.length==3?2:snapshot.data!.records!.length==4?3:snapshot.data!.records!.length==5?4:snapshot.data!.records!.length==6?5:snapshot.data!.records!.length==7?6:snapshot.data!.records!.length==8?7:snapshot.data!.records!.length==9?8:snapshot.data!.records!.length==10?9:snapshot.data!.records!.length==11?10:snapshot.data!.records!.length==12?11:12,
//
//                          autoPlay: false,
//                          enlargeFactor:.5.h,
//
//                          onPageChanged: (index, reason) {
//                            setState(() {
//                              counter1=index;
//                              counter=index;
//                              counter2=index;
//                              counter3=index;
//
//                            });
//                          },
//                          enlargeCenterPage: false,
//
//                          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
//                          pauseAutoPlayOnTouch: true,
//                          //enableInfiniteScroll: true,
//                          autoPlayAnimationDuration: Duration(milliseconds: 900),
//
//                        ),
//                        items:  snapshot.data!.records!.map((e) => Padding(
//                          padding:   EdgeInsets.only(top: 90.h),
//                          child: Column(
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: [
//                              Column(
//                                children: [
//                                  Row(
//                                    mainAxisAlignment: MainAxisAlignment.center,
//                                    children: [
//
//                                      Text('من تاريخ '),
//
//                                      Text('${day1[counter]}'),
//                                      Text('الي '),
//                                      Text('${day2[counter2]}'),
//
//                                    ],
//                                  ),
//
//                                  // if(snapshot.data!.records!.length==4)
//                                  //
//                                  //
//                                  //   if(counter1==snapshot.data!.records!.length-1)
//                                  //     Row(
//                                  //       mainAxisAlignment: MainAxisAlignment.center,
//                                  //       children: [
//                                  //
//                                  //         Text('من تاريخ '),
//                                  //         Text(' 2023/4/1 '),
//                                  //         Text('الي '),
//                                  //         Text(' 2023/4/30  '),
//                                  //
//                                  //       ],
//                                  //     ),
//                                  // if(counter1==snapshot.data!.records!.length-2)
//                                  //   Row(
//                                  //     mainAxisAlignment: MainAxisAlignment.center,
//                                  //     children: [
//                                  //
//                                  //       Text('من تاريخ '),
//                                  //       Text(' 2023/3/1 '),
//                                  //       Text('الي '),
//                                  //       Text(' 2023/3/31  '),
//                                  //
//                                  //     ],
//                                  //   ),
//                                  // if(counter1==snapshot.data!.records!.length-3)
//                                  //   Row(
//                                  //     mainAxisAlignment: MainAxisAlignment.center,
//                                  //     children: [
//                                  //
//                                  //       Text('من تاريخ '),
//                                  //       Text(' 2023/2/1'),
//                                  //       Text('الي '),
//                                  //       Text(' 2023/2/28  '),
//                                  //
//                                  //     ],
//                                  //   ),
//                                  // if(counter1==snapshot.data!.records!.length-4)
//                                  //   Row(
//                                  //     mainAxisAlignment: MainAxisAlignment.center,
//                                  //     children: [
//                                  //
//                                  //       Text('من تاريخ '),
//                                  //       Text(' 2023/1/1 '),
//                                  //       Text('الي '),
//                                  //       Text(' 2023/1/31  '),
//                                  //
//                                  //     ],
//                                  //   ),
//                                  //
//                                  // if(counter1==snapshot.data!.records!.length-5)
//                                  //   Row(
//                                  //     mainAxisAlignment: MainAxisAlignment.center,
//                                  //     children: [
//                                  //
//                                  //       Text('من تاريخ '),
//                                  //       Text(' 2023/5/1 '),
//                                  //       Text('الي '),
//                                  //       Text(' 2023/5/31  '),
//                                  //
//                                  //     ],
//                                  //   ),
//                                  // if(counter1==snapshot.data!.records!.length-6)
//                                  //   Row(
//                                  //     mainAxisAlignment: MainAxisAlignment.center,
//                                  //     children: [
//                                  //
//                                  //       Text('من تاريخ '),
//                                  //       Text(' 2023/6/1 '),
//                                  //       Text('الي '),
//                                  //       Text(' 2023/6/30  '),
//                                  //
//                                  //     ],
//                                  //   ),
//                                  // if(counter1==snapshot.data!.records!.length-7)
//                                  //   Row(
//                                  //     mainAxisAlignment: MainAxisAlignment.center,
//                                  //     children: [
//                                  //
//                                  //       Text('من تاريخ '),
//                                  //       Text(' 2023/7/1 '),
//                                  //       Text('الي '),
//                                  //       Text(' 2023/7/31  '),
//                                  //
//                                  //     ],
//                                  //   ),
//                                  // if(counter1==snapshot.data!.records!.length-8)
//                                  //   Row(
//                                  //     mainAxisAlignment: MainAxisAlignment.center,
//                                  //     children: [
//                                  //
//                                  //       Text('من تاريخ '),
//                                  //       Text(' 2023/8/1 '),
//                                  //       Text('الي '),
//                                  //       Text(' 2023/8/31  '),
//                                  //
//                                  //     ],
//                                  //   ),
//                                  // if(counter1==snapshot.data!.records!.length-9)
//                                  //   Row(
//                                  //     mainAxisAlignment: MainAxisAlignment.center,
//                                  //     children: [
//                                  //
//                                  //       Text('من تاريخ '),
//                                  //       Text(' 2023/9/1 '),
//                                  //       Text('الي '),
//                                  //       Text(' 2023/9/30  '),
//                                  //
//                                  //     ],
//                                  //   ),
//                                  // if(counter1==snapshot.data!.records!.length-10)
//                                  //   Row(
//                                  //     mainAxisAlignment: MainAxisAlignment.center,
//                                  //     children: [
//                                  //
//                                  //       Text('من تاريخ '),
//                                  //       Text(' 2023/10/1 '),
//                                  //       Text('الي '),
//                                  //       Text(' 2023/10/31  '),
//                                  //
//                                  //     ],
//                                  //   ),
//                                  // if(counter1==snapshot.data!.records!.length-11)
//                                  //   Row(
//                                  //     mainAxisAlignment: MainAxisAlignment.center,
//                                  //     children: [
//                                  //
//                                  //       Text('من تاريخ '),
//                                  //       Text(' 2023/11/1 '),
//                                  //       Text('الي '),
//                                  //       Text(' 2023/11/30  '),
//                                  //
//                                  //     ],
//                                  //   ),
//                                  // if(counter1==snapshot.data!.records!.length-12)
//                                  //   Row(
//                                  //     mainAxisAlignment: MainAxisAlignment.center,
//                                  //     children: [
//                                  //
//                                  //       Text('من تاريخ '),
//                                  //       Text(' 2023/12/1 '),
//                                  //       Text('الي '),
//                                  //       Text(' 2023/12/31  '),
//                                  //
//                                  //     ],
//                                  //   ),
//                                  Gap(15.h),
//                                  Column(
//                                    children: [
//                                      Row(
//
//
//                                        children: [
//                                          Container(
//
//                                            decoration: BoxDecoration(
//
//                                              border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                              color:Styles.defaultColor,
//                                            ),
//                                            height: 20.h,
//                                            width: 25.h,
//                                          ),
//                                          Container(
//
//                                            decoration: BoxDecoration(
//                                              color:Styles.defaultColor,
//                                              border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                            ),
//                                            height: 20.h,
//                                            width: 70.h,
//                                          ),
//                                          Container(
//
//                                            decoration: BoxDecoration(
//                                              color:Styles.defaultColor,
//                                              border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                            ),
//                                            child: Center(
//                                              child: Text(
//                                                'المصروفات',
//                                                style: TextStyle(
//                                                  fontSize: 12.sp,                                                    color:Styles.defaultColor5,
//
//                                                ),
//                                              ),
//                                            ),
//                                            height: 20.h,
//                                            width: 120.h,
//                                          ),
//                                          Container(
//
//                                            decoration: BoxDecoration(
//                                              color:Styles.defaultColor,
//                                              border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                            ),
//                                            child: Center(
//                                              child: Text(
//                                                'القيمة',
//                                                style: TextStyle(
//                                                  fontSize: 12.sp,
//                                                  color:Styles.defaultColor5,
//                                                ),
//                                              ),
//                                            ),
//                                            height: 20.h,
//                                            width: 75.h,
//                                          ),
//                                        ],
//                                      ),
//                                      Row(
//
//                                        mainAxisAlignment: MainAxisAlignment.start,
//                                        crossAxisAlignment: CrossAxisAlignment.start,
//
//
//
//
//                                        children: [
//                                          Column(
//                                            children: [
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .1.h)),
//
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '1',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 25.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .1.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '2',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 25.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .1.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '3',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 25.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .1.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '4',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 25.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .1.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '5',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 25.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .1.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '6',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 25.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .1.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '7',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 25.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .1.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '8',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 25.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .1.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '9',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 25.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .1.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '10',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 25.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .1.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '11',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 25.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .1.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '12',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 25.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .1.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '13',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 25.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .1.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    ' ',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 40.h,
//                                                width: 25.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    ' ',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 25.h,
//                                              ),
//
//
//
//                                            ],
//                                          ),
//                                          Container(
//
//                                            decoration: BoxDecoration(
//                                              color: Styles.defaultColor,
//                                              border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                            ),
//                                            child: Column(
//
//                                              children: [
//                                                Text('المستلم',style: TextStyle(
//                                                  fontSize:15.sp,
//                                                  fontWeight: FontWeight.w500,
//                                                  color:Styles.defaultColor5,
//
//                                                ),),
//                                                Row(
//                                                  mainAxisAlignment: MainAxisAlignment.center,
//
//
//                                                  children: [
//                                                    Text('شهر ',style: TextStyle(
//                                                      fontSize:15.sp,
//                                                      color:Styles.defaultColor5,
//                                                      fontWeight: FontWeight.w500,
//
//                                                    ),),
//                                                    Text('${days[counter3]}',style: TextStyle(
//                                                      fontSize:15.sp,
//                                                      color:Styles.defaultColor5,
//                                                      fontWeight: FontWeight.w500,
//
//                                                    ),),
//                                                  ],
//                                                ),
//                                                Text('${e.recep}',style: TextStyle(
//                                                  fontSize:15.sp,
//                                                  color:Styles.defaultColor5,
//
//                                                ),),
//
//
//                                              ],
//                                              mainAxisAlignment: MainAxisAlignment.center,
//                                            ),
//                                            height: 390.h,
//                                            width: 70.h,
//                                          ),
//                                          Column(
//                                            children: [
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'المواد الغذائيه والبلاستيك',
//                                                    style: TextStyle(
//                                                      fontSize: 10.sp,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 120.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'مستلزمات الأمير والأميرة',
//                                                    style: TextStyle(
//                                                      fontSize: 10.sp,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 120.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'مستلزمات الأمير فيصل والاميرات',
//                                                    style: TextStyle(
//                                                      fontSize: 8.5.sp,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 120.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'مستلزمات العمال',
//                                                    style: TextStyle(
//                                                      fontSize: 10.sp,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 120.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'المستلزمات الطبية',
//                                                    style: TextStyle(
//                                                      fontSize: 10.sp,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 120.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'عقود الصيانه',
//                                                    style: TextStyle(
//                                                      fontSize: 10.sp,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 120.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'مواد البناء والكهرباء',
//                                                    style: TextStyle(
//                                                      fontSize: 10.sp,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 120.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'صيانة السيارات',
//                                                    style: TextStyle(
//                                                      fontSize: 10.sp,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 120.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'المحروقات',
//                                                    style: TextStyle(
//                                                      fontSize: 10.sp,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 120.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'الخدمات العامة والإجراءات الحكومية',
//                                                    style: TextStyle(
//                                                      fontSize: 7.5.sp,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 120.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'مصاريف السفر',
//                                                    style: TextStyle(
//                                                      fontSize: 10.sp,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 120.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'الرواتب',
//                                                    style: TextStyle(
//                                                      fontSize: 10.sp,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 120.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'الإكراميات',
//                                                    style: TextStyle(
//                                                      fontSize: 10.sp,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 120.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  color: Colors.grey.shade300,
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'المتبقي',
//                                                    style: TextStyle(
//                                                      color: Colors.red,
//                                                      fontSize: 13.sp,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 40.h,
//                                                width: 120.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//
//
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.rest}',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 120.h,
//                                              ),
//                                            ],
//                                          ),
//                                          Column(
//                                            children: [
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.foodExpCost}',
//                                                    style: TextStyle(
//                                                      fontSize: 11.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 75.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.princePrincessExpCost}',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 75.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.princFaisalPrincessesExpCost}',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 75.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.laborersExpCost}',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 75.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.medicalSuppliesExpCost}',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 75.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.maintenanceContractsExpCost}',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 75.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.buildingExpCost}',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 75.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.carMaintenanceExpCost}',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 75.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.hydrocarbonsExpCost}',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 75.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.publicServicesExpCost}',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 75.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.travelExpCost}',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 75.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.salariesExpCost}',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 75.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.gratuitiesExpCost}',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 75.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  color: Colors.grey.shade300,
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .1.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    'مجموع المصروفات',
//                                                    textAlign: TextAlign.center,
//                                                    style: TextStyle(
//
//                                                      fontSize: 12.sp,
//                                                      color: Colors.red,
//                                                      fontWeight: FontWeight.w600,
//                                                    ),
//
//                                                  ),
//                                                ),
//                                                height: 40.h,
//                                                width: 75.h,
//                                              ),
//                                              Container(
//
//                                                decoration: BoxDecoration(
//                                                  border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: .2.h),horizontal: BorderSide(color: Colors.black,width: .2.h)),
//                                                ),
//                                                child: Center(
//                                                  child: Text(
//                                                    '${e.total}',
//                                                    style: TextStyle(
//                                                      fontSize: 12.sp,
//                                                    ),
//                                                  ),
//                                                ),
//                                                height: 25.h,
//                                                width: 75.h,
//                                              ),
//
//
//
//                                            ],
//                                          ),
//
//                                        ],
//                                      ),
//                                    ],
//                                  )
//                                  // Container(
//                                  //   decoration: BoxDecoration(
//                                  //     boxShadow: [
//                                  //       BoxShadow(
//                                  //         color: Colors.grey.shade400,
//                                  //         offset: const Offset(
//                                  //           1.0,
//                                  //           1.0,
//                                  //         ),
//                                  //         blurRadius: 5.0,
//                                  //         spreadRadius: .5,
//                                  //       ),], //Bo
//                                  //     color: Styles.defaultColor12,
//                                  //     borderRadius: BorderRadius.only(topRight: Radius.circular(10.r),topLeft: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
//                                  //   ),
//                                  //
//                                  //   child: Column(
//                                  //     children: [
//                                  //
//                                  //       SizedBox(
//                                  //         width:double.infinity,
//                                  //         child: DataTable(
//                                  //             dataRowHeight: 30.h,
//                                  //             headingRowHeight:30.h,
//                                  //
//                                  //
//                                  //
//                                  //             dataRowColor:
//                                  //             MaterialStateProperty.all(Colors.white),
//                                  //             columnSpacing:32.h,
//                                  //             border: TableBorder(
//                                  //                 horizontalInside: BorderSide(color: Colors.grey.shade50,width: .1.r),
//                                  //                 verticalInside: BorderSide(color:Colors.black,width: .1.r)
//                                  //             ),
//                                  //             columns:   [
//                                  //               DataColumn(
//                                  //                   label: Text(
//                                  //                     ' ',
//                                  //                   )),
//                                  //               DataColumn(
//                                  //                   label: Text(
//                                  //                     'القيمه',
//                                  //                     textAlign: TextAlign.center,
//                                  //                     style: TextStyle(
//                                  //                         color: Colors.white,
//                                  //                         fontSize: 10.sp,
//                                  //                         fontWeight: FontWeight.bold),
//                                  //                   )
//                                  //               ),
//                                  //
//                                  //               DataColumn(
//                                  //                   label: Padding(
//                                  //                     padding:   EdgeInsets.only(right: 35.h
//                                  //                     ),
//                                  //                     child: Text(
//                                  //                       'المصروفات',
//                                  //                       textAlign: TextAlign.center,
//                                  //                       style: TextStyle(
//                                  //                           color: Colors.white,
//                                  //                           fontSize: 10.sp,
//                                  //                           fontWeight: FontWeight.bold),
//                                  //
//                                  //                     ),
//                                  //                   )),
//                                  //               DataColumn(
//                                  //                   label: Text(
//                                  //                     'التاريخ',
//                                  //
//                                  //                     style: TextStyle(
//                                  //                         color: Styles.defaultColor5,
//                                  //                         fontSize: 10.sp,
//                                  //                         fontWeight: FontWeight.bold),
//                                  //                     textAlign: TextAlign.center,
//                                  //                   )),
//                                  //
//                                  //
//                                  //             ],
//                                  //             rows:   [
//                                  //               DataRow(
//                                  //                   color:MaterialStateProperty.all(Colors.grey.shade300),
//                                  //
//                                  //
//                                  //                   cells: [
//                                  //                     DataCell(Text(
//                                  //                       '1',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //                       ),
//                                  //                     )),
//                                  //
//                                  //                     DataCell(Text(
//                                  //                       '${snapshot.data!.records![0].foodExpCost}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Center(
//                                  //                       child: Text(
//                                  //                         'المواد الغذائيه والبلاستيك',
//                                  //                         style: TextStyle(
//                                  //                           fontSize: 10.sp,
//                                  //
//                                  //                         ),
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Text(
//                                  //                       '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![0].expDate}'))}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //                       ),
//                                  //                     )),
//                                  //
//                                  //
//                                  //                   ]
//                                  //
//                                  //               ),
//                                  //               DataRow(
//                                  //                   color:MaterialStateProperty.all(Colors.white),
//                                  //
//                                  //
//                                  //                   cells: [     DataCell(Text(
//                                  //                     '1',
//                                  //                     style: TextStyle(
//                                  //                       fontSize: 10.sp,
//                                  //                     ),
//                                  //                   )),
//                                  //
//                                  //                     DataCell(Text(
//                                  //                       '${snapshot.data!.records![0].princePrincessExpCost}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Center(
//                                  //                       child: Text(
//                                  //                         'مستلزمات الأمير والأميرة',
//                                  //                         style: TextStyle(
//                                  //                           fontSize: 10.sp,
//                                  //
//                                  //                         ),
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Text(
//                                  //                       '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![0].expDate}'))}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //                       ),
//                                  //                     )),
//                                  //
//                                  //                   ]
//                                  //
//                                  //               ),
//                                  //               DataRow(
//                                  //                   color:MaterialStateProperty.all(Colors.grey.shade300),
//                                  //
//                                  //
//                                  //                   cells: [     DataCell(Text(
//                                  //                     '1',
//                                  //                     style: TextStyle(
//                                  //                       fontSize: 10.sp,
//                                  //                     ),
//                                  //                   )),
//                                  //
//                                  //                     DataCell(Text(
//                                  //                       '${snapshot.data!.records![0].princFaisalPrincessesExpCost}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Center(
//                                  //                       child: Text(
//                                  //                         'مستلزمات الأمير فيصل والاميرات',
//                                  //                         style: TextStyle(
//                                  //                           fontSize: 10.sp,
//                                  //
//                                  //                         ),
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Text(
//                                  //                       '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![0].expDate}'))}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //                       ),
//                                  //                     )),
//                                  //
//                                  //                   ]
//                                  //
//                                  //               ),
//                                  //               DataRow(
//                                  //                   color:MaterialStateProperty.all(Colors.white),
//                                  //
//                                  //
//                                  //                   cells: [     DataCell(Text(
//                                  //                     '1',
//                                  //                     style: TextStyle(
//                                  //                       fontSize: 10.sp,
//                                  //                     ),
//                                  //                   )),
//                                  //
//                                  //                     DataCell(Text(
//                                  //                       '${snapshot.data!.records![0].laborersExpCost}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Center(
//                                  //                       child: Text(
//                                  //                         'مستلزمات العمال',
//                                  //                         style: TextStyle(
//                                  //                           fontSize: 10.sp,
//                                  //
//                                  //                         ),
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Text(
//                                  //                       '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![0].expDate}'))}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //                       ),
//                                  //                     )),
//                                  //
//                                  //                   ]
//                                  //
//                                  //               ),
//                                  //               DataRow(
//                                  //                   color:MaterialStateProperty.all(Colors.grey.shade300),
//                                  //
//                                  //
//                                  //                   cells: [     DataCell(Text(
//                                  //                     '1',
//                                  //                     style: TextStyle(
//                                  //                       fontSize: 10.sp,
//                                  //                     ),
//                                  //                   )),
//                                  //
//                                  //                     DataCell(Text(
//                                  //                       '${snapshot.data!.records![0].medicalSuppliesExpCost}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Center(
//                                  //                       child: Text(
//                                  //                         'المستلزمات الطبية',
//                                  //                         style: TextStyle(
//                                  //                           fontSize: 10.sp,
//                                  //
//                                  //                         ),
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Text(
//                                  //                       '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![0].expDate}'))}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //                       ),
//                                  //                     )),
//                                  //
//                                  //                   ]
//                                  //
//                                  //               ),
//                                  //               DataRow(
//                                  //                   color:MaterialStateProperty.all(Colors.white),
//                                  //
//                                  //
//                                  //                   cells: [     DataCell(Text(
//                                  //                     '1',
//                                  //                     style: TextStyle(
//                                  //                       fontSize: 10.sp,
//                                  //                     ),
//                                  //                   )),
//                                  //
//                                  //                     DataCell(Text(
//                                  //                       '${snapshot.data!.records![0].maintenanceContractsExpCost}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Center(
//                                  //                       child: Text(
//                                  //                         'عقود الصيانه',
//                                  //                         style: TextStyle(
//                                  //                           fontSize: 10.sp,
//                                  //
//                                  //                         ),
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Text(
//                                  //                       '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![0].expDate}'))}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //                       ),
//                                  //                     )),
//                                  //
//                                  //                   ]
//                                  //
//                                  //               ),
//                                  //               DataRow(
//                                  //                   color:MaterialStateProperty.all(Colors.grey.shade300),
//                                  //
//                                  //
//                                  //                   cells: [     DataCell(Text(
//                                  //                     '1',
//                                  //                     style: TextStyle(
//                                  //                       fontSize: 10.sp,
//                                  //                     ),
//                                  //                   )),
//                                  //
//                                  //                     DataCell(Text(
//                                  //                       '${snapshot.data!.records![0].buildingExpCost}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Center(
//                                  //                       child: Text(
//                                  //                         'مواد البناء والكهرباء',
//                                  //                         style: TextStyle(
//                                  //                           fontSize: 10.sp,
//                                  //
//                                  //                         ),
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Text(
//                                  //                       '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![0].expDate}'))}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //                       ),
//                                  //                     )),
//                                  //
//                                  //                   ]
//                                  //
//                                  //               ),
//                                  //               DataRow(
//                                  //                   color:MaterialStateProperty.all(Colors.white),
//                                  //
//                                  //
//                                  //                   cells: [     DataCell(Text(
//                                  //                     '1',
//                                  //                     style: TextStyle(
//                                  //                       fontSize: 10.sp,
//                                  //                     ),
//                                  //                   )),
//                                  //
//                                  //                     DataCell(Text(
//                                  //                       '${snapshot.data!.records![0].carMaintenanceExpCost}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Center(
//                                  //                       child: Text(
//                                  //                         'صيانة السيارات',
//                                  //                         style: TextStyle(
//                                  //                           fontSize: 10.sp,
//                                  //
//                                  //                         ),
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Text(
//                                  //                       '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![0].expDate}'))}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //                       ),
//                                  //                     )),
//                                  //
//                                  //                   ]
//                                  //
//                                  //               ),
//                                  //               DataRow(
//                                  //                   color:MaterialStateProperty.all(Colors.grey.shade300),
//                                  //
//                                  //
//                                  //                   cells: [     DataCell(Text(
//                                  //                     '1',
//                                  //                     style: TextStyle(
//                                  //                       fontSize: 10.sp,
//                                  //                     ),
//                                  //                   )),
//                                  //
//                                  //                     DataCell(Text(
//                                  //                       '${snapshot.data!.records![0].hydrocarbonsExpCost}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Center(
//                                  //                       child: Text(
//                                  //                         'المحروقات',
//                                  //                         style: TextStyle(
//                                  //                           fontSize: 10.sp,
//                                  //
//                                  //                         ),
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Text(
//                                  //                       '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![0].expDate}'))}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //                       ),
//                                  //                     )),
//                                  //
//                                  //                   ]
//                                  //
//                                  //               ),
//                                  //               DataRow(
//                                  //                   color:MaterialStateProperty.all(Colors.white),
//                                  //
//                                  //
//                                  //                   cells: [     DataCell(Text(
//                                  //                     '1',
//                                  //                     style: TextStyle(
//                                  //                       fontSize: 10.sp,
//                                  //                     ),
//                                  //                   )),
//                                  //
//                                  //                     DataCell(Text(
//                                  //                       '${snapshot.data!.records![0].publicServicesExpCost}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Center(
//                                  //                       child: Text(
//                                  //                         'الخدمات العامة والإجراءات الحكومية',
//                                  //                         style: TextStyle(
//                                  //                           fontSize: 9.sp,
//                                  //
//                                  //                         ),
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Text(
//                                  //                       '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![0].expDate}'))}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //                       ),
//                                  //                     )),
//                                  //
//                                  //                   ]
//                                  //
//                                  //               ),
//                                  //               DataRow(
//                                  //                   color:MaterialStateProperty.all(Colors.grey.shade300),
//                                  //
//                                  //
//                                  //                   cells: [     DataCell(Text(
//                                  //                     '1',
//                                  //                     style: TextStyle(
//                                  //                       fontSize: 10.sp,
//                                  //                     ),
//                                  //                   )),
//                                  //
//                                  //                     DataCell(Text(
//                                  //                       '${snapshot.data!.records![0].travelExpCost}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Center(
//                                  //                       child: Text(
//                                  //                         'مصاريف السفر',
//                                  //                         style: TextStyle(
//                                  //                           fontSize: 10.sp,
//                                  //
//                                  //                         ),
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Text(
//                                  //                       '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![0].expDate}'))}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //                       ),
//                                  //                     )),
//                                  //
//                                  //                   ]
//                                  //
//                                  //               ),
//                                  //               DataRow(
//                                  //                   color:MaterialStateProperty.all(Colors.white),
//                                  //
//                                  //
//                                  //                   cells: [     DataCell(Text(
//                                  //                     '1',
//                                  //                     style: TextStyle(
//                                  //                       fontSize: 10.sp,
//                                  //                     ),
//                                  //                   )),
//                                  //
//                                  //                     DataCell(Text(
//                                  //                       '${snapshot.data!.records![0].salariesExpCost}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Center(
//                                  //                       child: Text(
//                                  //                         'الرواتب',
//                                  //                         style: TextStyle(
//                                  //                           fontSize: 10.sp,
//                                  //
//                                  //                         ),
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Text(
//                                  //                       '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![0].expDate}'))}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //                       ),
//                                  //                     )),
//                                  //
//                                  //                   ]
//                                  //
//                                  //               ),
//                                  //               DataRow(
//                                  //                   color:MaterialStateProperty.all(Colors.grey.shade300),
//                                  //
//                                  //
//                                  //                   cells: [     DataCell(Text(
//                                  //                     '1',
//                                  //                     style: TextStyle(
//                                  //                       fontSize: 10.sp,
//                                  //                     ),
//                                  //                   )),
//                                  //
//                                  //                     DataCell(Text(
//                                  //                       '${snapshot.data!.records![0].gratuitiesExpCost}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Center(
//                                  //                       child: Text(
//                                  //                         'الإكراميات',
//                                  //                         style: TextStyle(
//                                  //                           fontSize: 10.sp,
//                                  //
//                                  //                         ),
//                                  //                       ),
//                                  //                     )),
//                                  //                     DataCell(Text(
//                                  //                       '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![0].expDate}'))}',
//                                  //                       style: TextStyle(
//                                  //                         fontSize: 10.sp,
//                                  //                       ),
//                                  //                     )),
//                                  //
//                                  //                   ]
//                                  //
//                                  //               ),
//                                  //
//                                  //             ]
//                                  //
//                                  //
//                                  //
//                                  //
//                                  //         ),
//                                  //       ),
//                                  //       Container(
//                                  //
//                                  //           height: 30.h,
//                                  //           width: double.infinity,
//                                  //           child:Container(
//                                  //             padding: EdgeInsets.symmetric(horizontal: 30.h),
//                                  //             child: Row(
//                                  //               mainAxisAlignment:  MainAxisAlignment.spaceBetween,
//                                  //               children: [
//                                  //
//                                  //                 Text('مجموع المصروفات',
//                                  //                   style: TextStyle(
//                                  //                     color: Colors.white,
//                                  //                     fontSize: 12.5,
//                                  //                     fontWeight: FontWeight.bold,
//                                  //                   ),),
//                                  //
//                                  //                 Text('المتبقي',
//                                  //                   style: TextStyle(
//                                  //                     color: Colors.white,
//                                  //                     fontSize: 12.5,
//                                  //                     fontWeight: FontWeight.bold,
//                                  //                   ),),
//                                  //
//                                  //               ],
//                                  //             ),
//                                  //           )
//                                  //
//                                  //       ),
//                                  //       Container(
//                                  //         height: 35.h,
//                                  //         width: double.infinity,
//                                  //         decoration: BoxDecoration(
//                                  //             color: Colors.white,
//                                  //             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r))
//                                  //
//                                  //
//                                  //
//                                  //         ),
//                                  //         child: Container(
//                                  //           padding: EdgeInsets.symmetric(horizontal: 30.h,),
//                                  //           child: Row(
//                                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                  //             children: [
//                                  //               Text( '${snapshot.data!.totalEx}',style: TextStyle(
//                                  //                 fontWeight: FontWeight.bold,
//                                  //
//                                  //                 fontSize: 12.sp,
//                                  //
//                                  //
//                                  //               ),),
//                                  //               Container(
//                                  //                 height: 35.h,
//                                  //                 width: 1.h,
//                                  //                 color: Styles.defaultColor2,
//                                  //               ),
//                                  //
//                                  //               Text('${snapshot.data!.rest}',style: TextStyle(
//                                  //
//                                  //                 fontWeight: FontWeight.bold,
//                                  //
//                                  //                 fontSize: 12.sp,
//                                  //
//                                  //               ),),
//                                  //             ],
//                                  //           ),
//                                  //         ),
//                                  //       )
//                                  //
//                                  //
//                                  //
//                                  //     ],
//                                  //   ),
//                                  // ),
//                                ],
//                              ),
//                            ],
//                          ),
//                        )).toList(),
//                      )
//                    ],
//                  )
//                   ],
//                 ),
//               ),
//             );
//           }else {
//             return Center(
//               child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defaultColor2),),
//             );
//           }
//        },
//       ),
//     );
//          }
//
//
// }