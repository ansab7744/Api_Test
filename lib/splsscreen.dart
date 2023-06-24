import 'package:apitest/homepage.dart';
import 'package:apitest/loginpage.dart';
import 'package:apitest/shrd.dart';
import 'package:flutter/material.dart';

class splsscreen extends StatefulWidget {
  const splsscreen({super.key});

  @override
  State<splsscreen> createState() => _splsscreenState();
}

class _splsscreenState extends State<splsscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    start();
  }

  start() async {
    String? token = await getShared();
    Future.delayed(
      Duration(seconds: 1),
      () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            // ignore: unnecessary_null_comparison
            if (token == null) {
              return loginpage();
            } else {
              return homepage();
            }
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Container(
                height: 300,
                width: 300,
                child: Image.asset(
                  "asset/splash_image.jpg",
                  fit: BoxFit.fill,
                )),
          )
        ],
      ),
    );
  }
}
