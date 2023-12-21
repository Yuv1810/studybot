import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:studybot/Pages/MychatApp.dart';
import 'package:studybot/Pages/SearchPage.dart';
import 'package:studybot/Pages/Profile.dart';
import 'package:studybot/dummy2.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() {
    return Homestate();
  }
}

class Homestate extends State<Home> {
  List<String?> labelsdata = ['Home', 'Search', 'Engine', 'Saved', 'Profile'];
  List<String?> labels = ['Home', "", "", "", ""];
  var iconpadding = 16.0;

  String data = 'hvsdhjsv';
  void submit() {
    setState(() {
      //handle click in this of continue button
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
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
                MaterialPageRoute(builder: (ctx) => const MyChatApp()));
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
            // child: const Icon(
            //   Icons.ac_unit_rounded,
            //   size: 28,
            // ),
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
    ));
  }
}
