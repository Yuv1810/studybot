import 'package:flutter/material.dart';
import 'subjectform.dart';
import 'Nameform.dart';

class Page1 extends StatefulWidget {
  final void Function() fun2;
  const Page1({super.key, required this.fun2});
  @override
  State<StatefulWidget> createState() {
    return Page1State();
  }
}

class Page1State extends State<Page1> {
  String page = 'Nameform';

  void fun() {
    //changin page
    //saves the data
    setState(() {
      page = 'Subjectform';
    });
  }

  // void fun2() {
  //   setState(() {
  //     page = 'Home';
  //   });
  // }

  @override
  void initState() {
    Nameform(fun: fun, fun2: widget.fun2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget form = Nameform(
      fun: fun,
      fun2: widget.fun2,
    );
    if (page == 'Subjectform') {
      setState(() {
        form = Subjectform(submit: widget.fun2);
      });
    } else {
      form = Nameform(
        fun: fun,
        fun2: widget.fun2,
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        //yaha
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              '  Profile',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 46),
              textAlign: TextAlign.left,
            ),
            Center(
              child: Container(
                height: 4, // Adjust height as needed
                color: const Color.fromARGB(255, 159, 169, 177),
                width: 380,
              ),
            ),

            //another child that switching needs to be done

            form,
          ],
          //
        ),
      ),
    );
  }
}
