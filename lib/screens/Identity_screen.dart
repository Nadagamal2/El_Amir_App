import 'package:alamir_app/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui' as ui;
import '../models/Alert_model.dart';
import '../models/identity_model.dart';
import 'Alerts_screen.dart';
import 'notification_screen.dart';


class IdentityScreen extends StatefulWidget {
  const IdentityScreen({Key? key}) : super(key: key);

  @override
  State<IdentityScreen> createState() => _IdentityScreenState();
}

class _IdentityScreenState extends State<IdentityScreen> {
  final double minScale=1;
  final double maxScale=4;


  Future<identity> getData() async {
    final response = await http.get(
        Uri.parse('http://eibtekone-001-site3.atempurl.com/api/GetAllIdentities'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // print(data['Records']);
      return identity.fromJson(jsonDecode(response.body));
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
                            'الهوية',
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FutureBuilder(
                            future: getData(),
                            builder: (context,snapshot){
                              if(snapshot.hasData){
                                return  Container(
                                  height: 700.h,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(top: 60.h, ),
                                  child: ListView .separated(
                                      itemBuilder: (context,index)=>Container(

                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:   EdgeInsets.only(right:40.h,left: 40.h),
                                              child: Container(
                                                height: 210.h,
                                                width: double.infinity,
                                                padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.h),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
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
                                                    borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(10.r),
                                                      bottomRight: Radius.circular(10.r),
                                                      topLeft: Radius.circular(10.r),
                                                      topRight: Radius.circular(10.r),
                                                    )),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    InkWell(
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
                                                                                'http://eibtekone-001-site3.atempurl.com${snapshot.data!.records![index].identityImgUrl}',
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
                                                        height: 140.h,

                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5.r),
                                                            image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:  NetworkImage(
                                                                'http://eibtekone-001-site3.atempurl.com${snapshot.data!.records![index].identityImgUrl}',
                                                              ),
                                                            )
                                                        ),
                                                      ),
                                                    ),

                                                    Gap(15.h),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          width: 3.5.h,
                                                          height: 35.h,



                                                          decoration: BoxDecoration(
                                                            color:Styles.defaultColor,
                                                            borderRadius: BorderRadius.circular(5.r),
                                                          ),
                                                        ),
                                                        Gap(10.h),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text( '${snapshot.data!.records![index].identityNumber}',style: TextStyle(
                                                              color: Styles.defaultColor7,
                                                              fontSize: 13.5.sp,
                                                            ),),

                                                          ],
                                                        ),


                                                      ],
                                                    ),





                                                  ],
                                                ),
                                              ),
                                            ),
                                            Gap(20.h),
                                          ],
                                        ),
                                      ),
                                      separatorBuilder: (context,index){return Gap(0);},
                                      itemCount: snapshot.data!.records!.length),
                                );
                              }  else {
                                return Center(
                                  child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defaultColor2),),
                                );
                              }
                            },

                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
        }



}
