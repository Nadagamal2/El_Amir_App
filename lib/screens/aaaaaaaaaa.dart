// import 'package:alamir_app/app_style.dart';
// import 'package:alamir_app/models/cars_model.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:ui' as ui;
// import 'package:toggle_switch/toggle_switch.dart';
//
// import '../models/Alert_model.dart';
//
// class CarScreen extends StatefulWidget {
//   const CarScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CarScreen> createState() => _CarScreenState();
// }
//
// class _CarScreenState extends State<CarScreen> {
//   // List<bool> isSelected = [ true,false,false];
//   int counter = 0;
//   int counter1 = 0;
//
//
//   CarouselController buttonCarouselController = CarouselController();
//
//
//
//
//   Future<Cars> getData() async {
//     final response = await http.get(
//         Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetAllCars'));
//     var data = jsonDecode(response.body.toString());
//
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       // print(data['Records']);
//       return Cars.fromJson(jsonDecode(response.body));
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
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: ui.TextDirection.rtl,
//
//       child: FutureBuilder(
//         future: getData(),
//         builder: (context, snapshot) {
//
//           if (snapshot.hasData) {
//
//
//
//             return Scaffold(
//               backgroundColor: Styles.defaultColor,
//               body: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding:
//                       EdgeInsets.symmetric(horizontal: 15.h, vertical: 27.h),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               Get.back();
//                             },
//                             child: const Icon(
//                               Icons.arrow_back_outlined,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Text(
//                             'السيارات',
//                             style: TextStyle(
//                               color: Styles.defaultColor2,
//                               fontSize: 24.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           FutureBuilder(
//                             future: getDataAlert(),
//                             builder: (context,snapshot){
//                               if(snapshot.hasData){
//                                 return Stack(
//                                   children: [
//                                     Icon(
//                                       Icons.notifications_none_outlined,
//                                       color: Colors.white,
//                                     ),
//                                     CircleAvatar(
//                                       backgroundColor: Colors.red,
//                                       radius: 5.5.r,
//                                       child: Text(
//                                         '${snapshot.data!.count}',
//                                         style: TextStyle(color: Colors.white,fontSize: 8.sp),
//                                       ),
//                                     )
//                                   ],
//                                 );
//                               }else {
//                                 return  Icon(
//                                   Icons.notifications_none_outlined,
//                                   color: Colors.white,
//                                 );
//                               }
//                             },
//
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       child: CarouselSlider(
//                         options: CarouselOptions(
//                           height: 140.h,
//                           autoPlay: true,
//                           viewportFraction: .6.h,
//                           onPageChanged: (index, reason) {
//                             setState(() {
//
//
//                               print(index);
//
//                               print(snapshot.data!.records![ index].id);
//
//
//
//                             });
//                           },
//                           enlargeCenterPage: true,
//                           aspectRatio: 16 / 9.h,
//                           autoPlayCurve: Curves.fastLinearToSlowEaseIn,
//                           pauseAutoPlayOnTouch: true,
//                           //enableInfiniteScroll: true,
//                           autoPlayAnimationDuration: Duration(milliseconds: 900),
//                           //  viewportFraction: .8,
//                         ),
//                         items:  snapshot.data!.records!.map((e) => Container(
//                           margin: EdgeInsets.symmetric(horizontal: 5.h),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20.h),
//                             image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: NetworkImage(
//                                 'http://eibtekone-001-site3.atempurl.com${e.carImgUrl}',
//                               ),
//                             ),
//                           ),
//                           height: 50,
//                         )).toList(),
//                         carouselController: buttonCarouselController,
//                       ),
//                     ),
//                     FutureBuilder(
//                       future: getData(),
//                       builder: (context,snapshot){
//                         if(snapshot.hasData){
//
//
//
//                           return Center(
//                             child: Padding(
//                               padding: EdgeInsets.only(right: 20.h, left: 20.h),
//                               child: Column(
//                                 children: [
//                                   Gap(50.h),
//
//
//
//
//
//
//                                   Container(
//                                     padding: EdgeInsets.symmetric(horizontal: 3.h),
//                                     height: 40.h,
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20.r),
//                                       color: Styles.defaultColor2,
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         InkWell(
//                                           onTap:(){
//                                             counter=0;
//                                             setState(() {
//
//                                             });
//                                           },
//                                           child: Container(
//                                             height: 33.h,
//                                             width: 85.h,
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(20.r),
//                                               color: counter==0? Styles.defaultColor5:Styles.defaultColor2 ,
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 'بيانات السياره',
//                                                 style: TextStyle(
//                                                     fontSize: 12.sp,
//                                                     color: counter==0?Colors.black:Styles.defaultColor5,
//                                                     fontWeight: FontWeight.bold
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         InkWell(
//                                           onTap: (){
//                                             counter=1;
//                                             setState(() {
//
//                                             });
//                                           },
//                                           child: Container(
//                                             height: 33.h,
//                                             width: 85.h,
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(20.r),
//                                               color: counter==1? Styles.defaultColor5:Styles.defaultColor2 ,
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 'التأمين',
//                                                 style: TextStyle(
//                                                     fontSize: 12.sp,
//                                                     color: counter==1?Colors.black:Styles.defaultColor5,
//                                                     fontWeight: FontWeight.bold
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         InkWell(
//                                           onTap: (){
//                                             counter=2;
//                                             setState(() {
//
//                                             });
//                                           },
//                                           child: Container(
//                                             height: 33.h,
//                                             width: 85.h,
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(20.r),
//                                               color: counter==2? Styles.defaultColor5:Styles.defaultColor2 ,
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 'بيانات الفحص',
//                                                 style: TextStyle(
//                                                     fontSize: 12.sp,
//                                                     color: counter==2?Colors.black:Styles.defaultColor5,
//                                                     fontWeight: FontWeight.bold
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Gap(20.h),
//                                   Container(
//                                     padding: EdgeInsets.all(15.h),
//                                     height: 220.h,
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       color: Styles.defaultColor5,
//                                       borderRadius: BorderRadius.circular(15.r),
//                                     ),
//                                     child: counter==0?
//                                     Padding(
//                                       padding:   EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: [
//                                           Column(
//                                             children: [
//
//
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Text('Car Model ',style: TextStyle(color: Styles.defaultColor,fontSize: 15.sp),),
//                                                       Gap(10.h),
//                                                       Text('${snapshot.data!.records![counter1].carModel}',style: TextStyle(color: Styles.defaultColor8,fontSize: 12.sp),),
//                                                     ],
//                                                   ),
//                                                   Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//
//                                                     children: [
//                                                       Text('Car Color ',style: TextStyle(color: Styles.defaultColor,fontSize: 15.sp),),
//                                                       Gap(10.h),
//                                                       Text('${snapshot.data!.records![0].carColor}',style: TextStyle(color: Styles.defaultColor8,fontSize: 12.sp),),
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                               Divider(
//                                                 height: 50.h,
//                                                 color: Styles.defaultColor7,
//                                                 thickness: .1,
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//
//                                                     children: [
//                                                       Text('Car Numbers ',style: TextStyle(color: Styles.defaultColor,fontSize: 15.sp),),
//                                                       Gap(10.h),
//                                                       Text('${snapshot.data!.records![0].carNumbers}',style: TextStyle(color: Styles.defaultColor8,fontSize: 12.sp),),
//                                                     ],
//                                                   ),
//                                                   Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//
//                                                     children: [
//                                                       Text('MaintenanceTime ',style: TextStyle(color: Styles.defaultColor,fontSize: 15.sp),),
//                                                       Gap(10.h),
//                                                       Text('${snapshot.data!.records![0].maintenanceTime}',style: TextStyle(color: Styles.defaultColor8,fontSize: 12.sp),),
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//
//
//                                         ],
//                                       ),
//                                     ):
//                                     counter==1?
//                                     Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//
//                                           margin: EdgeInsets.symmetric(horizontal: 5.h),
//                                           height:150.h,
//                                           width: 180.h,
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius: BorderRadius.circular(20.h),
//                                             image: DecorationImage(
//                                               fit: BoxFit.cover,
//
//                                               image: NetworkImage(
//                                                 'http://eibtekone-001-site3.atempurl.com${snapshot.data!.records![0].insurancesImgUrl}',
//                                               ),
//                                             ),
//                                           ),
//
//                                         ),
//
//
//
//
//                                       ],
//                                     ):
//                                     Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//
//                                         Text('${snapshot.data!.records![0].maintenanceTime}',style: TextStyle(
//                                             fontSize: 20.sp,
//                                             color: Styles.defaultColor,
//                                             fontWeight: FontWeight.w600
//
//                                         ),)
//
//
//
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         } else {
//                           return Center(
//                             child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defaultColor2),),
//                           );
//                         }
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defaultColor2),),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
// //Container(
// //                           margin: EdgeInsets.symmetric(horizontal: 5.h),
// //                           decoration: BoxDecoration(
// //                             color: Colors.white,
// //                             borderRadius: BorderRadius.circular(20.h),
// //                             image: DecorationImage(
// //                               image: NetworkImage(
// //                                 'http://eibtekone-001-site3.atempurl.com${snapshot.data!.records![0].carImgUrl}',
// //                               ),
// //                             ),
// //                           ),
// //                           height: 50,
// //
// //                         ),
//
// //----------------------------------------------------------------------
// //                                                rows:  List.generate(snapshot.data!.records!.length , (index) =>  DataRow(
// //                                                     color:MaterialStateProperty.all(Colors.white),
// //
// //
// //                                                     cells: [
// //
// //                                                       DataCell(Text(
// //                                                         '${snapshot.data!.records![index].expCost}',
// //                                                         style: TextStyle(
// //                                                           fontSize: 10.sp,
// //
// //                                                         ),
// //                                                       )),
// //                                                       DataCell(Center(
// //                                                         child: Text(
// //                                                           '${snapshot.data!.records![index].expDeatils}',
// //                                                           style: TextStyle(
// //                                                             fontSize: 10.sp,
// //
// //                                                           ),
// //                                                         ),
// //                                                       )),
// //                                                       DataCell(Text(
// //                                                         '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![index].expDate}'))}',
// //                                                         style: TextStyle(
// //                                                           fontSize: 10.sp,
// //                                                         ),
// //                                                       )),
// //
// //                                                     ]
// //
// //                                                 ),)