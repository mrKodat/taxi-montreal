import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taxi/Style.dart';
import 'package:taxi/ui/latest_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: blue,
                    image: DecorationImage(
                        image: AssetImage("asset/images/hotelBig.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
              ))
        ],
      ),
      bottomNavigationBar: InkWell(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LatestPage()),
              ),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
          )),
    );
  }
}
