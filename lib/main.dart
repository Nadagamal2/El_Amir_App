import 'package:alamir_app/app_style.dart';
import 'package:alamir_app/screens/bottom_nav.dart';
import 'package:alamir_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark));

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

       builder: (context,child){
        return GetMaterialApp(
          theme: ThemeData(
              primaryColor: Styles.defaultColor2,
              accentColor: Styles.defaultColor2
          ),
          title: 'MTA',
          debugShowCheckedModeBanner: false,
          home:child
        );
       },
      child: const HomePage(),
    );
  }
}
 class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

   @override
   State<HomePage> createState() => _HomePageState();
 }

 class _HomePageState extends State<HomePage> {
   final userData =GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   userData.writeIfNull('isLogged', false) ;
   Future.delayed(Duration.zero,()async{
     checkIfLoged();
   });
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: SafeArea(
         child: Center(
           child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defaultColor2),
         ),
       ),
     ));
   }

  void checkIfLoged() {
    userData.read('isLogged')?Get.offAll(BottomNavScreen()):Get.offAll(SignInScreen());
  }
 }

