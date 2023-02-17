 import 'dart:convert';

import 'package:alamir_app/app_style.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
 import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
 import 'package:http/http.dart' as http;

import 'bottom_nav.dart';




class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final userData =GetStorage();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  void login(String email,String password)async{
    try{
      final response = await http.post(
        Uri.parse('http://eibtekone-001-site3.atempurl.com/api/Login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "email":email,
          "password":password,
        }

        ));
      var data=jsonDecode(response.body.toString());
      if(data["isSuccess"]==true){

        print(data);
        userData.write('isLogged', true);
        userData.write('email', email);
        userData.write('password', password);
        Get.offAll(BottomNavScreen());


      //  return login.fromJson(jsonDecode(response.body));

      }else{
        print("Faild");
      }


    }catch(e){
      print(e.toString());
    }
  }
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:   EdgeInsets.symmetric(horizontal: 36.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(105.h),
              Center(
                  child: Image.asset(
                    'assets/Group 2.png',
                    fit: BoxFit.cover,
                    height: 170.h,
                    width: 60.h,
                  )),
              Gap(15.h),
              Text(
                'تسجيل الدخول',
                style: TextStyle(
                  color: Styles.defaultColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600
                ),

              ),


              Gap(32.h),
              defaultFieldForm(


                  controller: emailController,

                  padding:  EdgeInsets.symmetric(vertical: 3.h),
                  Type: TextInputType.emailAddress,
                  prefix: FluentSystemIcons.ic_fluent_mail_regular,
                  lable: 'البريد الإلكتروني',
                  hint: 'البريد الإلكتروني'),
              Gap(18.h),
              defaultFieldForm(
                  controller: passwordController,
                  padding:  EdgeInsets.symmetric(vertical: 3.h),
                  Type: TextInputType.text,
                  prefix: FluentSystemIcons.ic_fluent_lock_regular,
                  lable: 'كلمة السر',
                  hint: 'كلمه السر'),

              Gap(50.h),
              ElevatedButton(
                
                onPressed: () {
                  login(emailController.text.toString(), passwordController.text.toString());
                },
                child: Text('دخول', style: TextStyle(
                  color: Styles.defaultColor5,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.infinity, 43.h),
                  maximumSize:Size(double.infinity, 43.h) ,
                  minimumSize: Size(double.infinity, 43.h),
 
                  backgroundColor: Styles.defaultColor2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }

}


Widget defaultFieldForm({
  required TextInputType Type,
  required IconData prefix,
  required String lable,
  required String hint,
 required EdgeInsets?  padding,
   String? Function(String?)?  validator,
   String? Function(String?)?  onChanged,
    TextEditingController? controller,

}) =>
    TextFormField(
      validator: validator,
      onChanged: onChanged,
      cursorColor: Colors.grey.shade400,
      keyboardType: Type,
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding:padding,


        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: .5),
          borderRadius: BorderRadius.circular(6),
        ),
        border: OutlineInputBorder(),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: .5.r),
          borderRadius: BorderRadius.circular(6.r),
        ),
        prefixIcon: Icon(
          prefix,
          size: 20.sp,
          color: Styles.defaultColor2,

        ),
        labelText: lable,
        hintText: hint,


      ),
    );

 Widget buildBottum({
   required double height,
   required double width,
   required Text text,
   required Function() onTap,
   EdgeInsetsGeometry? margin,
   required BoxDecoration? decoration,
 }) =>
     Container(
       height: height,
       margin: margin,
       width: width,
       decoration: decoration,
       child: InkWell(
         child: Center(
           child: text,
         ),
         onTap: onTap,
       ),
     );