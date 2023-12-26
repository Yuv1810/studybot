import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {
  String image;
  String data;
  int index;

  HomeList(
      {super.key,
      required this.data,
      required this.image,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return (GestureDetector(
      onTap: () {
        //make the list of push and use index to push it
        //use the index
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 7,
        width: MediaQuery.of(context).size.width / 3.5,
        decoration: BoxDecoration(
          color: const Color.fromARGB(155, 153, 150, 245),
          border:
              Border.all(width: 1.0, color: const Color.fromARGB(255, 5, 0, 0)),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Stack(children: [
          Image.asset(
            image,
            fit: BoxFit.contain,
            scale: 1,
          ),
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    data,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                )
              ])
        ]),
      ),
    ));
  }
}
