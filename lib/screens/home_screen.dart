import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_api_flutter_course/screens/user_screen.dart';


import '../widgets/appbar_icons.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text('Home'),
          leading: AppBarIcons(
            function:(){} ,
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcons(
                function: (){
                  Navigator.push(context,
                    PageTransition(
                    type: PageTransitionType.fade,
                    child: const UserScreen(),
                  ),);
                },
                icon: IconlyBold.user3)
          ],
        ),
        body: Center(child: Text("Welcome to this course")),
      ),
    );
  }
}
