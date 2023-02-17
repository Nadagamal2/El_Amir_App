import 'package:alamir_app/app_style.dart';
 import 'package:alamir_app/screens/home_screen.dart';
import 'package:alamir_app/screens/today_tasks_screen.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'account_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavScreen extends StatefulWidget {
    const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  int _selectedIndex = 0;
  static final List<Widget> _screens=<Widget>[


    TodayTasksScreen(),
    HomeScreen(),

     AccountScreen(),
    ];



  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [

      PersistentBottomNavBarItem(
        icon: const Icon( Icons.event_note_rounded),

          activeColorPrimary: Styles.defaultColor2,
          inactiveColorPrimary: Styles.defaultColor5
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FluentSystemIcons.ic_fluent_apps_regular,color: Colors.white,),

          activeColorPrimary: Styles.defaultColor2,
          inactiveColorPrimary: Styles.defaultColor5
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FluentSystemIcons.ic_fluent_person_regular),

          activeColorPrimary: Styles.defaultColor2,
          inactiveColorPrimary: Styles.defaultColor5
      ),



    ];
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
    final PersistentTabController _controller =
  PersistentTabController(initialIndex: 1);
  @override
  Widget build(BuildContext context) {

    return  PersistentTabView(
      context,
      controller: _controller,
      screens: _screens,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor:Styles.defaultColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      // screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
      //   animateTabTransition: true,
      //   curve: Curves.ease,
      //   duration: Duration(milliseconds: 200),
      // ),
      navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}


//Widget defaultFieldForm({
//   required TextInputType Type,
//   required IconData prefix,
//   required String lable,
//   required String hint,
//  required EdgeInsets?  padding,
//    String? Function(String?)?  validator,
//    String? Function(String?)?  onChanged,
//     TextEditingController? controller,
//
// }) =>
//     TextFormField(
//       validator: validator,
//       onChanged: onChanged,
//       cursorColor: Colors.grey.shade400,
//       keyboardType: Type,
//       controller: controller,
//       decoration: InputDecoration(
//         floatingLabelBehavior: FloatingLabelBehavior.never,
//         contentPadding:padding,
//
//
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(width: .5),
//           borderRadius: BorderRadius.circular(6),
//         ),
//         border: OutlineInputBorder(),
//
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(width: .5),
//           borderRadius: BorderRadius.circular(6),
//         ),
//         prefixIcon: Icon(
//           prefix,
//           size: 20,
//           color: Styles.IconColor,
//         ),
//         labelText: lable,
//         hintText: hint,
//         hintStyle: Styles.lable_Hint,
//         labelStyle: Styles.lable_Hint,
//       ),
//     );
//Scaffold(
//
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         onTap: _onItemTapped,
//         elevation: 2,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         selectedItemColor: Styles.defaultColor2,
//         unselectedItemColor: Styles.defaultColor5,
//         backgroundColor: Styles.defaultColor,
//         items: [
//           BottomNavigationBarItem(
//               icon: Icon(FluentSystemIcons.ic_fluent_apps_regular,),
//               activeIcon: Icon(FluentSystemIcons.ic_fluent_apps_regular,),
//               label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon( Icons.event_note_rounded),
//               activeIcon: Icon( Icons.event_note_rounded),
//               label: 'Notes'),
//
//           BottomNavigationBarItem(
//               icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
//               activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
//               label: 'Profile'),
//         ],
//       ),
//     );