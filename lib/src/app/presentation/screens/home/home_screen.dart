
import 'package:eshop/src/app/presentation/theme/color_theme.dart';
import 'package:eshop/src/app/presentation/utils/consts.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();





  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: kWhiteColor,
    
      
      
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kPadding * 2, vertical: kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------------  SLIDER ---------------

                  const SizedBox(height: kPadding * 2),
            Text("Home")
             
                ],
              ),
            ),
          ),
        ));
  }
}
