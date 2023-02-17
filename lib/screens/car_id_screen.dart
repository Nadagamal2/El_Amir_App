import 'package:alamir_app/app_style.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/cars_model.dart';

 class CarScreenId extends StatefulWidget {

  const CarScreenId({Key? key,   }) : super(key: key);

  @override
  State<CarScreenId> createState() => _CarScreenIdState();
}

class _CarScreenIdState extends State<CarScreenId> {

  int counter = 0;


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
  @override
  Widget build(BuildContext context  ) {
    return  FutureBuilder(
      future: getData(),
       builder: (context,snapshot){
        if(snapshot.hasData){
          var id=snapshot.data!.records!.length;
          return Center(
            child: Padding(
              padding: EdgeInsets.only(right: 20.h, left: 20.h),
              child: Column(
                children: [
                  Gap(50.h),





                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.h),
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Styles.defaultColor2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap:(){
                            counter=0;
                            setState(() {

                            });
                          },
                          child: Container(
                            height: 33.h,
                            width: 85.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: counter==0? Styles.defaultColor5:Styles.defaultColor2 ,
                            ),
                            child: Center(
                              child: Text(
                                'بيانات السياره',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: counter==0?Colors.black:Styles.defaultColor5,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            counter=1;
                            setState(() {

                            });
                          },
                          child: Container(
                            height: 33.h,
                            width: 85.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: counter==1? Styles.defaultColor5:Styles.defaultColor2 ,
                            ),
                            child: Center(
                              child: Text(
                                'التأمين',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: counter==1?Colors.black:Styles.defaultColor5,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            counter=2;
                            setState(() {

                            });
                          },
                          child: Container(
                            height: 33.h,
                            width: 85.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: counter==2? Styles.defaultColor5:Styles.defaultColor2 ,
                            ),
                            child: Center(
                              child: Text(
                                'بيانات الفحص',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: counter==2?Colors.black:Styles.defaultColor5,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(20.h),
                  Container(
                    padding: EdgeInsets.all(15.h),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Car Model ',style: TextStyle(color: Styles.defaultColor,fontSize: 15.sp),),
                                      Gap(10.h),
                                      Text('${snapshot.data!.records![id].carModel}',style: TextStyle(color: Styles.defaultColor8,fontSize: 12.sp),),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text('Car Color ',style: TextStyle(color: Styles.defaultColor,fontSize: 15.sp),),
                                      Gap(10.h),
                                      Text('${snapshot.data!.records![id].carColor}',style: TextStyle(color: Styles.defaultColor8,fontSize: 12.sp),),
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
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text('Car Numbers ',style: TextStyle(color: Styles.defaultColor,fontSize: 15.sp),),
                                      Gap(10.h),
                                      Text('${snapshot.data!.records![id].carNumbers}',style: TextStyle(color: Styles.defaultColor8,fontSize: 12.sp),),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text('MaintenanceTime ',style: TextStyle(color: Styles.defaultColor,fontSize: 15.sp),),
                                      Gap(10.h),
                                      Text('${snapshot.data!.records![id].maintenanceTime}',style: TextStyle(color: Styles.defaultColor8,fontSize: 12.sp),),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),


                        ],
                      ),
                    ):
                    counter==1?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(

                          margin: EdgeInsets.symmetric(horizontal: 5.h),
                          height:150.h,
                          width: 180.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.h),
                            image: DecorationImage(
                              fit: BoxFit.cover,

                              image: NetworkImage(
                                'http://eibtekone-001-site3.atempurl.com${snapshot.data!.records![id].insurancesImgUrl}',
                              ),
                            ),
                          ),

                        ),




                      ],
                    ):
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('${snapshot.data!.records![0].maintenanceTime}',style: TextStyle(
                            fontSize: 20.sp,
                            color: Styles.defaultColor,
                            fontWeight: FontWeight.w600

                        ),)



                      ],
                    ),
                  )
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
    );
  }
}
