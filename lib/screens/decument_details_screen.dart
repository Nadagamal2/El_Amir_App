import 'package:alamir_app/app_style.dart';
import 'package:alamir_app/screens/passport_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'Alerts_screen.dart';
import 'Identity_screen.dart';
import 'national_address_screen.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import '../models/Alert_model.dart';
import 'notification_screen.dart';
class DocumentDetailsScreen extends StatefulWidget {
  const DocumentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DocumentDetailsScreen> createState() => _DocumentDetailsScreenState();
}

class _DocumentDetailsScreenState extends State<DocumentDetailsScreen> {
  Future<NotificationModel> getData() async {
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
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Styles.defaultColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [

              SizedBox(
                height: 610.h,
                child: Stack(
                  children: [
                    Positioned(
                      top: -250.h,
                      right: -35.h,
                      child: Image(
                          fit: BoxFit.cover,
                          width: 300.h,
                          image: const AssetImage(
                            'assets/Group 5.png',
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:   [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(NotificationScreen());
                      },
                      child: FutureBuilder(
                        future: getData(),
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
              Padding(
                padding:   EdgeInsets.only(top: 440.h),
                child: Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Rectangle 8.png'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 90.h),
                child: Column(
                  children: [

                    Text(
                      'الوثائق',
                      style: TextStyle(
                        color: Styles.defaultColor5,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(25.h),
                    InkWell(
                      onTap: (){
                        Get.to(IdentityScreen());
                      },
                      child: Padding(
                        padding:   EdgeInsets.symmetric(horizontal: 20.h),
                        child: Container(
                          height: 90.h,

                          width: double.infinity,

                          child: Stack(
                            children: [



                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                                child: Image(
                                  image: AssetImage('assets/Group 18.png'),
                                  fit: BoxFit.cover,
                                  height: 90.h,

                                ),
                              ),

                              Center(
                                child: Text(
                                  'الهوية',
                                  style: TextStyle(
                                    color: Styles.defaultColor5,
                                    fontSize: 30.sp,

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Gap(10.h),
                    InkWell(
                      onTap: (){
                        Get.to(PassportScreen());
                      },
                      child: Padding(
                        padding:   EdgeInsets.symmetric(horizontal: 20.h),
                        child: Container(
                          height: 90.h,

                          width: double.infinity,

                          child: Stack(
                            children: [



                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                                child: Image(
                                  image: AssetImage('assets/Group 8.png'),
                                  fit: BoxFit.cover,
                                  height: 90.h,

                                ),
                              ),

                              Center(
                                child: Text(
                                  'جواز السفر',
                                  style: TextStyle(
                                    color: Styles.defaultColor5,
                                    fontSize: 30.sp,

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Gap(10.h),
                    InkWell(
                      onTap: (){
                        Get.to(NationalAddressScreen());

                      },
                      child: Padding(
                        padding:   EdgeInsets.symmetric(horizontal: 20.h),
                        child: Container(
                          height: 90.h,

                          width: double.infinity,

                          child: Stack(
                            children: [



                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                                child: Image(
                                  image: AssetImage('assets/Group 10.png'),
                                  fit: BoxFit.cover,
                                  height: 90.h,

                                ),
                              ),

                              Center(
                                child: Text(
                                  'العنوان الوطني',
                                  style: TextStyle(
                                    color: Styles.defaultColor5,
                                    fontSize: 30.sp,

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Gap(12.5.h),

                    ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              // fromLTRB
                              Colors.black,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0, 0.1, 0.3, 1],
                          ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image(
                          image: AssetImage(
                            'assets/aaa.png',
                          ),
                        )),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
