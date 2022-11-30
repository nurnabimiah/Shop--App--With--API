import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/screens/user_screen.dart';
import 'package:store_api_flutter_course/widgets/sale_widget.dart';


import '../widgets/appbar_icons.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }


  @override
  void dispose() {
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: TextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Search",
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Theme.of(context).cardColor)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.secondary
                      )
                    ),
                    suffixIcon: Icon(IconlyLight.search,color: lightIconsColor,)
                  ) ,
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: size.height*0.25,
                child: Swiper(
                    itemCount: 3,
                    //autoplay: true,
                    itemBuilder: (ctx,index){
                      return  const SaleWidget();
                    },
                  pagination:SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: Colors.red,
                    )
                  ),
                  //control: SwiperControl(),
                ),
              ),


            ],
          ),
        )
      ),
    );
  }
}
