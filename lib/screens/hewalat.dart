// import 'package:alamir_app/app_style.dart';
// import 'package:alamir_app/screens/Alerts_screen.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'dart:convert';
// import 'dart:ui' as ui;
//
// import '../models/Alert_model.dart';
// import '../models/hewalat_model.dart';
//
// class HewalatScreen extends StatefulWidget {
//   const HewalatScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HewalatScreen> createState() => _HewalatScreenState();
// }
//
// class _HewalatScreenState extends State<HewalatScreen> {
//   int counter1=0;
//
//   Future<hewalat> getData() async {
//     final response = await http.get(
//         Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetRemYearCost'));
//     var data = jsonDecode(response.body.toString());
//
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       // print(data['Records']);
//       return hewalat.fromJson(jsonDecode(response.body));
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
//     return  Directionality(
//       textDirection: ui.TextDirection.rtl,
//       child: FutureBuilder(
//         future: getData(),
//         builder: (context,snapshot){
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
//                             'الحوالات',
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
//                     Padding(
//                       padding:   EdgeInsets.only(top: 90.h,right: 20.h,left: 20.h),
//                       child: CarouselSlider(
//                         options: CarouselOptions(
//                           height: 1000.h,
//
//
//                           autoPlay: false,
//                           viewportFraction: .9.h,
//
//                           onPageChanged: (index, reason) {
//                             setState(() {
//                               counter1=index;
//
//                             });
//                           },
//                           enlargeCenterPage: true,
//
//                           autoPlayCurve: Curves.fastLinearToSlowEaseIn,
//                           pauseAutoPlayOnTouch: true,
//                           //enableInfiniteScroll: true,
//                           autoPlayAnimationDuration: Duration(milliseconds: 900),
//                           //  viewportFraction: .8,
//                         ),
//                         items:  snapshot.data!.records!.map((e) =>  Container(
//                           width: double.infinity,
//                           padding: EdgeInsets.symmetric(horizontal: 5.h),
//
//
//                           child: Column(
//                             children: [
//                               if(e.month==1)
//
//                                 Text(' حوالة شهر :1'),
//                               Gap(15.h),
//                               Container(
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.shade400,
//                                       offset: const Offset(
//                                         1.0,
//                                         1.0,
//                                       ),
//                                       blurRadius: 5.0,
//                                       spreadRadius: .5,
//                                     ),], //Bo
//                                   color: Styles.defaultColor12,
//                                   borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
//                                 ),
//                                 child: DataTable(
//                                     dataRowHeight: 33.h,
//                                     headingRowHeight:40.h,
//
//
//                                     dataRowColor:
//                                     MaterialStateProperty.all(Colors.white),
//                                     columnSpacing: 20.h,
//                                     border: TableBorder(
//                                         horizontalInside: BorderSide(color: Colors.grey.shade50,width: .5.r),
//                                         verticalInside: BorderSide(color: Styles.defaultColor2)
//                                     ),
//                                     columns:   [
//                                       DataColumn(
//                                           label: Padding(
//                                             padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                                             child: Text(
//                                               'تاريخ \nالحواله',
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 10.sp,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           )),
//                                       DataColumn(
//                                           label: Text(
//                                             'مبلغ \nالحواله',
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 10.sp,
//                                                 fontWeight: FontWeight.bold),
//                                             textAlign: TextAlign.center,
//                                           )),
//                                       DataColumn(
//                                           label: Text(
//                                             'نوع \nالحواله',
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 10.sp,
//                                                 fontWeight: FontWeight.bold),
//                                             textAlign: TextAlign.center,
//
//                                           )),
//                                       DataColumn(
//                                           label: Text(
//                                             'الهدف من الحواله',
//
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 10.sp,
//                                                 fontWeight: FontWeight.bold),
//
//                                             textAlign: TextAlign.center,)
//                                       ),
//
//
//
//
//                                     ],
//
//                                     rows:[
//
//                                       DataRow(
//                                           color:MaterialStateProperty.all(Colors.white),
//
//
//                                           cells: [
//
//                                             DataCell(Text(
//                                               '${DateFormat('yyyy-MM-dd').format(DateTime.parse('${snapshot.data!.records![0].remDate}'))}' ,
//                                               style: TextStyle(
//                                                 fontSize: 9.sp,
//                                               ),
//                                             )),
//                                             DataCell(Text(
//                                               '${snapshot.data!.records![0].remCost}',
//                                               style: TextStyle(
//                                                 fontSize: 9.sp,
//                                               ),
//                                             )),
//                                             DataCell(Text(
//                                               '${snapshot.data!.records![0].remType}',
//                                               style: TextStyle(
//                                                 fontSize: 9.sp,
//                                               ),
//                                             )),
//                                             DataCell(SizedBox(
//                                               width: 70.h,
//                                               child: Text(
//                                                 '${snapshot.data!.records![0].remDeatils}',
//                                                 textAlign: TextAlign.center,
//                                                 maxLines: 1,softWrap: false,
//                                                 overflow: TextOverflow.ellipsis,
//
//                                                 style: TextStyle(
//
//                                                   fontSize: 9.sp,
//                                                 ),
//                                               ),
//                                             )),
//
//
//
//
//                                           ]
//
//                                       ),
//                                       DataRow(
//                                           color:MaterialStateProperty.all(Colors.white),
//
//
//                                           cells: [
//
//                                             DataCell(Text(
//                                               '${DateFormat('yyyy-MM-dd').format(DateTime.parse('${snapshot.data!.records![1].remDate}'))}' ,
//                                               style: TextStyle(
//                                                 fontSize: 9.sp,
//                                               ),
//                                             )),
//                                             DataCell(Text(
//                                               '${snapshot.data!.records![1].remCost}',
//                                               style: TextStyle(
//                                                 fontSize: 9.sp,
//                                               ),
//                                             )),
//                                             DataCell(Text(
//                                               '${snapshot.data!.records![1].remType}',
//                                               style: TextStyle(
//                                                 fontSize: 9.sp,
//                                               ),
//                                             )),
//                                             DataCell(SizedBox(
//                                               width: 70.h,
//                                               child: Text(
//                                                 '${snapshot.data!.records![1].remDeatils}',
//                                                 textAlign: TextAlign.center,
//                                                 maxLines: 1,softWrap: false,
//                                                 overflow: TextOverflow.ellipsis,
//
//                                                 style: TextStyle(
//
//                                                   fontSize: 9.sp,
//                                                 ),
//                                               ),
//                                             )),
//
//
//
//
//                                           ]
//
//                                       ),
//
//
//
//
//
//
//                                     ]
//
//
//
//
//
//
//                                 ),
//                               ),
//                               Container(
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.shade400,
//                                       offset: const Offset(
//                                         1.0,
//                                         1.0,
//                                       ),
//                                       blurRadius: 5.0,
//                                       spreadRadius: .5,
//                                     ),], //Bo
//                                   color: Styles.defaultColor12,
//                                 ),
//
//                                 height: 82.h,
//
//                                 child: Column(
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.symmetric(horizontal: 20.h,  ),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: [
//
//
//                                           Text('المجموع',style: TextStyle(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 10.5.sp
//                                           ),),
//
//                                           Container(
//                                             height: 27.h,
//                                             width: 1.h,
//
//                                           ),
//                                           Text('${e.total}'
//                                             ,style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 10.5.sp
//                                             ),),
//
//
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(horizontal: 20.h, ),
//
//                                       color: Styles.defaultColor,
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: [
//                                           Text('المتبقي من الشهر الماضي',style: TextStyle(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 10.5.sp
//                                           ),),
//
//                                           Container(
//                                             height: 27.h,
//                                             width: 1.h,
//
//                                           ),
//                                           Text('${e.lastRest}'
//                                             ,style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 10.5.sp
//                                             ),),
//
//
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(horizontal: 20.h, ),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: [
//                                           Text('مجموع المستلم مع المتبقي من الشهر الماضي',style: TextStyle(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 10.5.sp
//                                           ),),
//
//                                           Container(
//                                             height: 27.h,
//                                             width: 1.h,
//
//                                           ),
//                                           Text('${e.totalPlusLastRest}'
//                                             ,style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 10.5.sp
//                                             ),),
//
//
//
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//
//                               ),
//                               Container(
//                                 height: 30.h,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.shade400,
//                                       offset: const Offset(
//                                         1.0,
//                                         1.0,
//                                       ),
//                                       blurRadius: 5.0,
//                                       spreadRadius: .5,
//                                     ),], //Bo
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
//                                 ),
//
//                               )
//
//
//
//                             ],
//                           ),
//                         )).toList(),
//                       ),
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
//
//
//
//
//   }
// }
