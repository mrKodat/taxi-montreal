import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi/Animation/FadeAnimation.dart';
import 'package:taxi/ui/booking_page.dart';
import 'package:taxi/ui/flighy_page.dart';
import 'package:taxi/ui/message_page.dart';
import 'package:taxi/ui/see_location_page.dart';
import 'package:taxi/ui/send_location_page.dart';
import 'package:taxi/ui/send_mail_page.dart';
import 'package:taxi/ui/time_page.dart';

class LatestPage extends StatefulWidget {
  const LatestPage({super.key});

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
  final List<List<String>> products = [
    ['assets/images/1.png', 'CADILLAC ESCALADE', '100 \$'],
    ['assets/images/2.png', 'CADILLAC XT6', '120 \$'],
    ['assets/images/3.png', 'CADILLAC XTS', '120 \$'],
    ['assets/images/4.png', 'CHEVROLET SUBURBAN', '80 \$'],
    ['assets/images/5.png', 'LINCOLN MKT', '80 \$']
  ];

  int currentIndex = 0;

  void _next() {
    setState(() {
      if (currentIndex < products.length - 1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _preve() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        child: FadeAnimation(
            1.5,
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 1, 210, 152),
              ),
              child: Center(
                child: Text(
                  "CALL NOW",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            )),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onHorizontalDragEnd: (DragEndDetails details) {
                    if (details.velocity.pixelsPerSecond.dx > 0) {
                      _preve();
                    } else if (details.velocity.pixelsPerSecond.dx < 0) {
                      _next();
                    }
                  },
                  child: FadeAnimation(
                      .8,
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(products[currentIndex][0]),
                                fit: BoxFit.fitWidth)),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  colors: [
                                Colors.grey[700]!.withOpacity(.9),
                                Colors.grey.withOpacity(.0),
                              ])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FadeAnimation(
                                1,
                                Container(
                                    child: const Text(
                                  "OUR FLEET",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 255, 80, 103)),
                                )),
                              ),
                              Column(
                                children: [
                                  FadeAnimation(
                                      1,
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                         products[currentIndex][1],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 49, 49, 49)),
                                        ),
                                      )),
                                  FadeAnimation(
                                      1,
                                      Container(
                                        width: 90,
                                        margin: EdgeInsets.only(bottom: 30),
                                        child: Row(
                                          children: _buildIndicator(),
                                        ),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
              Container(
                height: 470,
                child: Transform.translate(
                  offset: Offset(0, 0),
                  child: FadeAnimation(
                      1,
                      Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _container("1.png", "BOOOK NOWS",
                                      const BookingPage()),
                                  _container("2.png", "SEND TEXT MESSAGE",
                                      MessagePage()),
                                  _container("3.png", "WATCH LIVE FLIGHTS",
                                      const FlightPage()),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _container("4.png", "SEND MY LOCATION",
                                      const SendLoactionPage()),
                                  _container("5.png", "SEE LOCATION OF LIMO",
                                      const SeeLocationPage()),
                                  _container("6.png", "SEND US AN EMAIL",
                                      const SendMailPage()),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _container("7.png", "GOTO WEBSITE", {}),
                                  _container("8.png", "USEFUL LINKS",
                                      const TimePage()),
                                  _container(
                                      "9.png", "NEWS AND ANNOUNCEMENTS", () {}),
                                ],
                              )
                            ],
                          ))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return Expanded(
      child: Container(
        height: 4,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isActive ? Colors.grey[800] : Colors.white),
      ),
    );
  }

  Widget _container(icon, text, dynamic page) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
        height: 110,
        width: 110,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 230, 230, 230),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              "assets/icon/" + icon,
              scale: 2.7,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < products.length; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
