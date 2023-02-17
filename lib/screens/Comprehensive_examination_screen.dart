// import 'package:alamir_app/app_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'dart:convert';
// import 'dart:ui' as ui;
// import '../models/Alert_model.dart';
// import '../models/Comprehensive_examination_model.dart';
// import 'Alerts_screen.dart';
//
// class ComprehensiveExaminationScreen extends StatefulWidget {
//   const ComprehensiveExaminationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ComprehensiveExaminationScreen> createState() => _ComprehensiveExaminationScreenState();
// }
//
// class _ComprehensiveExaminationScreenState extends State<ComprehensiveExaminationScreen> {
//   Future<Comprehensive_examination> getData() async {
//     final response = await http.get(
//         Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetMaintanceDates'));
//     var data = jsonDecode(response.body.toString());
//
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       // print(data['Records']);
//       return Comprehensive_examination.fromJson(jsonDecode(response.body));
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
//   @override
//   Widget build(BuildContext context) {
//     return  Directionality(
//       textDirection: ui.TextDirection.rtl,
//       child: Scaffold(
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
//                             'الفحص الشامل',
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
//                     Center(
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 100.h, right: 20, left: 20),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             FutureBuilder(
//                               future: getData(),
//                               builder: (context,snapshot){
//                                 if(snapshot.hasData){
//                                   return Container(
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.grey.shade400,
//                                           offset: const Offset(
//                                             1.0,
//                                             1.0,
//                                           ),
//                                           blurRadius: 5.0,
//                                           spreadRadius: .5,
//                                         ),], //Bo
//                                       color: Styles.defaultColor12,
//                                       borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
//                                     ),
//
//                                     child: Column(
//                                       children: [
//                                         DataTable(
//                                             dataRowHeight: 30,
//                                             headingRowHeight:40,
//
//
//
//                                             dataRowColor:
//                                             MaterialStateProperty.all(Colors.white),
//                                             columnSpacing:58.5.h,
//                                             border: TableBorder(
//                                                 horizontalInside: BorderSide(color: Colors.grey.shade50,width: .5),
//                                                 verticalInside: BorderSide(color: Styles.defaultColor2)
//                                             ),
//                                             columns:   [
//                                               DataColumn(
//                                                   label: Center(
//                                                     child: Text(
//                                                       'رقم السياره',
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 11.sp,
//                                                           fontWeight: FontWeight.bold),
//                                                     ),
//                                                   )
//                                               ),
//
//                                               DataColumn(
//                                                   label: Center(
//                                                     child: Text(
//                                                       'نوع السيارة',
//
//
//
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 11.sp,
//                                                           fontWeight: FontWeight.bold),
//
//                                                     ),
//                                                   )),
//                                               DataColumn(
//                                                   label: Center(
//                                                     child: Text(
//                                                       'التاريخ',
//
//
//
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 11.sp,
//                                                           fontWeight: FontWeight.bold),
//
//                                                     ),
//                                                   )),
//
//                                             ],
//                                             rows:  List.generate(snapshot.data!.records!.length , (index) =>   DataRow(
//                                                 color:MaterialStateProperty.all(Colors.white),
//
//
//                                                 cells: [
//
//
//                                                   DataCell(Text(
//                                                     '${snapshot.data!.records![index].carNumbers}',
//                                                     style: TextStyle( fontSize: 9.sp,height: 1.h,),
//                                                   )),  DataCell(Text(
//                                                     '${snapshot.data!.records![index].carModel}',
//                                                     style: TextStyle( fontSize: 9.sp,height: 1.h,),
//                                                   )),
//                                                   DataCell(Text(
//                                                     '${DateFormat('dd-MM-yyyy').format(DateTime.parse('${snapshot.data!.records![index].maintenanceTime}'))}' ,
//                                                     style: TextStyle( fontSize: 9.sp,height: 1.h,),
//                                                   )),
//                                                 ]
//
//                                             ),)
//
//
//                                         ),
//
//
//
//
//
//                                       ],
//                                     ),
//                                   );
//                                 }else {
//                                   return Center(
//                                     child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defaultColor2),),
//                                   );
//                                 }
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//     );
//         }
//
// }
