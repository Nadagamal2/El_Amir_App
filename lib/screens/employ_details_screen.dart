// import 'package:alamir_app/app_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'dart:ui' as ui;
// import 'Alerts_screen.dart';
// import 'employee_document_screen.dart';
// import 'employee_screen.dart';
// import 'mission_screen.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'dart:convert';
//
// import '../models/Alert_model.dart';
// class EmployeeDetailsScreen extends StatefulWidget {
//   const EmployeeDetailsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
// }
//
// class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
//   Future<NotificationModel> getData() async {
//     final response = await http.get(
//         Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetAllNotification'));
//     var data = jsonDecode(response.body.toString());
//
//     if (data['iSuccssed']==true) {
//
//       print(response.body.length);
//       return NotificationModel.fromJson(jsonDecode(response.body));
//     } else {
//
//       throw Exception('Failed to load album');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Directionality(
//       textDirection: ui.TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Styles.defaultColor,
//         body: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//
//           child: Stack(
//             children: [
//
//               SizedBox(
//                 height: 610.h,
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       top: -250.h,
//                       right: -35.h,
//                       child: Image(
//                           fit: BoxFit.cover,
//                           width: 300.h,
//                           image: const AssetImage(
//                             'assets/Group 5.png',
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 40.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children:   [
//                     InkWell(
//                       onTap: (){
//                         Get.back();
//                       },
//                       child: Icon(
//                         Icons.arrow_back_outlined,
//                         color: Colors.white,
//                       ),
//                     ),
//                     InkWell(
//                       onTap: (){
//                         Get.to(AlertsScreen());
//                       },
//                       child: FutureBuilder(
//                         future: getData(),
//                         builder: (context,snapshot){
//                           if(snapshot.hasData){
//                             return Stack(
//                               children: [
//                                 Icon(
//                                   Icons.notifications_none_outlined,
//                                   color: Colors.white,
//                                 ),
//                                 CircleAvatar(
//                                   backgroundColor: Colors.red,
//                                   radius: 5.5.r,
//                                   child: Text(
//                                     '${snapshot.data!.count}',
//                                     style: TextStyle(color: Colors.white,fontSize: 8.sp),
//                                   ),
//                                 )
//                               ],
//                             );
//                           }else {
//                             return  Icon(
//                               Icons.notifications_none_outlined,
//                               color: Colors.white,
//                             );
//                           }
//                         },
//
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding:   EdgeInsets.only(top: 440.h),
//                 child: Container(
//                   height: 200.h,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage('assets/Rectangle 8.png'),
//                           fit: BoxFit.cover
//                       )
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding:  EdgeInsets.only(top: 90.h),
//                 child: Column(
//                   children: [
//
//                     Text(
//                       'الموظفين',
//                       style: TextStyle(
//                         color: Styles.defaultColor5,
//                         fontSize: 40.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Gap(25.h),
//                     InkWell(
//                       onTap: (){
//                         Get.to(EmployeeScreen());
//                       },
//                       child: Padding(
//                         padding:   EdgeInsets.symmetric(horizontal: 20.h),
//                         child: Container(
//                           height: 90.h,
//
//                           width: double.infinity,
//
//                           child: Stack(
//                             children: [
//
//
//
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(3.r),
//                                 ),
//                                 child: Image(
//                                   image: AssetImage('assets/ee.png'),
//                                   fit: BoxFit.cover,
//                                   height: 90.h,
//
//                                 ),
//                               ),
//
//                               Center(
//                                 child: Text(
//                                   'بيانات الموظفين',
//                                   style: TextStyle(
//                                     color: Styles.defaultColor5,
//                                     fontSize: 30.sp,
//
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Gap(10.h),
//                     InkWell(
//                       onTap: (){
//                         Get.to(MissionScreen());
//                       },
//                       child: Padding(
//                         padding:   EdgeInsets.symmetric(horizontal: 20.h),
//                         child: Container(
//                           height: 90.h,
//
//                           width: double.infinity,
//
//                           child: Stack(
//                             children: [
//
//
//
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(3.r),
//                                 ),
//                                 child: Image(
//                                   image: AssetImage('assets/eee.png'),
//                                   fit: BoxFit.cover,
//                                   height: 90.h,
//
//                                 ),
//                               ),
//
//                               Center(
//                                 child: Text(
//                                   'المهام',
//                                   style: TextStyle(
//                                     color: Styles.defaultColor5,
//                                     fontSize: 30.sp,
//
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Gap(10.h),
//                     InkWell(
//                       onTap: (){
//                         Get.to(EmployeeDocumentScreen());
//                       },
//                       child: Padding(
//                         padding:   EdgeInsets.symmetric(horizontal: 20.h),
//                         child: Container(
//                           height: 90.h,
//
//                           width: double.infinity,
//
//                           child: Stack(
//                             children: [
//
//
//
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(3.r),
//                                 ),
//                                 child: Image(
//                                   image: AssetImage('assets/eeee.png'),
//                                   fit: BoxFit.cover,
//                                   height: 90.h,
//
//                                 ),
//                               ),
//
//                               Center(
//                                 child: Text(
//                                   'جميع وثائق الموظفين',
//                                   style: TextStyle(
//                                     color: Styles.defaultColor5,
//                                     fontSize: 30.sp,
//
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Gap(3.h),
//
//                     ShaderMask(
//                         shaderCallback: (rect) {
//                           return const LinearGradient(
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topCenter,
//                             colors: [
//                               // fromLTRB
//                               Colors.black,
//                               Colors.black,
//                               Colors.black,
//                               Colors.transparent,
//                             ],
//                             stops: [0, 0.1, 0.3, 1],
//                           ).createShader(
//                             Rect.fromLTRB(0, 0, rect.width, rect.height),
//                           );
//                         },
//                         blendMode: BlendMode.dstIn,
//                         child: Image(
//                           image: AssetImage(
//                             'assets/e.png',
//                           ),
//                         )),
//                   ],
//                 ),
//               ),
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
