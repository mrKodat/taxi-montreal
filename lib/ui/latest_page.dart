import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi/Animation/FadeAnimation.dart';

class LatestPage extends StatefulWidget {
  const LatestPage({super.key});

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
  final List<List<String>> products = [
    ['asset/images/hotelBig.png', 'Hugo Boss Oxygen', '100 \$'],
    ['asset/images/hotel2.png', 'Hugo Boss Signature', '120 \$'],
    ['asset/images/watch-2.jpg', 'Hugo Boss Signature', '120 \$'],
    ['asset/images/watch-3.jpg', 'Casio G-Shock Premium', '80 \$']
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
      body: Container(
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
                              fit: BoxFit.cover)),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                              Colors.grey[700]!.withOpacity(.9),
                              Colors.grey.withOpacity(.0),
                            ])),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeAnimation(
                                1,
                                Container(
                                  width: 90,
                                  margin: EdgeInsets.only(bottom: 50),
                                  child: Row(
                                    children: _buildIndicator(),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )),
              ),
            ),
            Container(
              height: 450,
              child: Transform.translate(
                offset: Offset(0, 0),
                child: FadeAnimation(
                    1,
                    Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _container("1.png", "BOOOK NOWS", (){ }),
                                _container("2.png", "SEND TEXT MESSAGE", (){ }),
                                 _container("3.png", "WATCH LIVE FLIGHTS", (){ }),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _container("4.png", "SEND MY LOCATION", (){ }),
                                 _container("5.png", "SEE LOCATION OF LIMO", (){ }),
                                _container("6.png", "SEND US AN EMAIL", (){ }),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 _container("7.png", "GOTO WEBSITE", (){ }),
                                 _container("8.png", "TIME ZONES IN USA", (){ }),
                                 _container("9.png", "NEWS AND ANNOUNCEMENTS", (){ }),
                              ],
                            )
                          ],
                        ))),
              ),
            )
          ],
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

  Widget _container(icon, text, Function onTap) {
    return InkWell(
      onTap: () => onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
        height: 110,
        width: 110,
        decoration: BoxDecoration(
          color:Color.fromARGB(255, 250, 230, 230),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(text, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, 
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),), Image.asset("assets/icon/" +icon, scale: 2.7,)],

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
