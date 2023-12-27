import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Pages/MyChatAppformain.dart';
import 'Pages/SearchPage.dart';
import 'Pages/Profile.dart';
import 'homelist.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Homestate();
  }
}

class Slidebar {
  Slidebar({required this.data, required this.image});
  String data;
  String image;

  String getdata() {
    return data;
  }

  String getimage() {
    return image;
  }
}

class Homestate extends State<Home> {
  List<String?> labelsdata = ['Home', 'Search', 'Engine', 'Saved', 'Profile'];
  List<String?> labels = ['Home', "", "", "", ""];
  var iconpadding = 16.0;
  var currindex = 0;
  int cnt = 0;
  List<Slidebar> textforevaluation = [
    Slidebar(data: 'Take test', image: 'assets/y3.png'),
    Slidebar(data: 'Question', image: 'assets/y1.png'),
    Slidebar(data: 'Feedback', image: 'assets/y4.png'),
    Slidebar(data: 'Notes', image: 'assets/y2.png'),
  ];
  List text = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
  ];

  void submit() {
    setState(() {
      // handle click in this of continue button
    });
  }

  void fun() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        iconPadding: iconpadding,
        buttonBackgroundColor: const Color.fromARGB(255, 183, 175, 254),
        animationCurve: Curves.easeOut,
        color: const Color.fromARGB(254, 108, 100, 254),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) async {
          await Future.delayed(const Duration(milliseconds: 150));
          setState(() {
            iconpadding = 16.0;
            for (int i = 0; i < 5; i++) {
              labels[i] = "";
            }
            labels[index] = labelsdata[index];
          });

          if (index == 1) {
            await Future.delayed(const Duration(milliseconds: 350));
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => const SearchPage()));
          }

          if (index == 2) {
            setState(() {
              iconpadding = 1;
            });
            await Future.delayed(const Duration(milliseconds: 350));
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => const MyChatAppformain()));
          }

          if (index == 4) {
            await Future.delayed(const Duration(milliseconds: 350));
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => const Profile()));
          }
        },
        items: [
          CurvedNavigationBarItem(
            child: const Icon(
              Icons.home,
              size: 38,
            ),
            label: labels[0],
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          CurvedNavigationBarItem(
            child: const Icon(
              Icons.search_rounded,
              size: 38,
            ),
            label: labels[1],
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          CurvedNavigationBarItem(
            child: Image.asset('assets/Engine.png', scale: 1),
            label: labels[2],
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          CurvedNavigationBarItem(
            child: const Icon(
              Icons.save_outlined,
              size: 38,
            ),
            label: labels[3],
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          CurvedNavigationBarItem(
            child: const Icon(
              Icons.account_circle_sharp,
              size: 38,
            ),
            label: labels[4],
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 100 * 6,
            ),
            GestureDetector(
              onTap: () {},
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 183, 175, 254),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 100 * 23,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/resume-lesson.png',
                      scale: 1.9,
                    ),
                  ),
                  const Center(
                    heightFactor: 5,
                    child: Text(
                      'Back to Lessons',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100 * 0.7,
            ),
            Container(
              height: 3,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              color: const Color.fromARGB(255, 106, 106, 107),
            ),
            Text(
              'Evaluation and Feedback',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: MediaQuery.of(context).size.height / 100 * 2.5,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100 * 0.44,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: textforevaluation.map(
                  (obj) {
                    return (HomeList(
                      data: obj.getdata(),
                      image: obj.getimage(),
                      index: textforevaluation.indexOf(obj),
                    ));
                  },
                ).toList(),
              ),
            ),
            Container(
              height: 3,
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: const Color.fromARGB(255, 106, 106, 107),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100 * .44,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 3.8,
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currindex = index;
                  });
                },
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: text.map((index) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Color.fromARGB(254, 108, 100, 255),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/carousel.avif',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Center(
                              child: Text(
                                text[currindex],
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  backgroundColor:
                                      Color.fromARGB(85, 255, 255, 255),
                                  color: Colors.black87,
                                  wordSpacing: 3,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100 * 1.3,
            ),
            AnimatedSmoothIndicator(
              activeIndex: currindex,
              count: 5,
              axisDirection: Axis.horizontal,
              effect: const SlideEffect(
                spacing: 8.0,
                dotWidth: 9,
                dotHeight: 9,
                paintStyle: PaintingStyle.stroke,
                strokeWidth: 1.5,
                dotColor: Color.fromARGB(255, 183, 175, 254),
                activeDotColor: Color.fromARGB(254, 108, 100, 254),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
