// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:apitest/homepage.dart';
import 'package:apitest/shrd.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class loginpage extends StatelessWidget {
  loginpage({super.key});

  TextEditingController usrnmctr = TextEditingController();

  TextEditingController pswdctr = TextEditingController();

  login(BuildContext context) async {
    var Data = <String, dynamic>{};
    Data["username"] = usrnmctr.text.trim();
    Data["password"] = pswdctr.text.trim();

    var url = "https://lead-management-api.foxa.in/api/v1/accounts/login/";
    var response = await http.post(Uri.parse(url), body: Data);

    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      // print(response.body);
      String Token = map["data"]["token"];
      setShared(Token);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => homepage(),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("error"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Color.fromARGB(255, 30, 28, 57)),
            child: Padding(
              padding: const EdgeInsets.only(top: 160),
              child: Column(
                children: [
                  Text(
                    "Log In",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Please sign in to your existing account",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 300,
            ),
            child: Stack(
              children: [
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25, left: 20),
                    child: Text(
                      "UserName",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      color: Color.fromARGB(255, 221, 220, 222),
                    ),
                    child: TextFormField(
                      controller: usrnmctr,
                      decoration: InputDecoration(
                        labelText: "UserName",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 145, left: 18),
                  child: Text(
                    "PASSWORD",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 180, left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      color: Color.fromARGB(255, 221, 220, 222),
                    ),
                    child: TextFormField(
                      controller: pswdctr,
                      decoration: InputDecoration(
                        hintText: "* * * * * * * *",
                        suffixIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 260, left: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 23,
                        width: 23,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          // color: Colors.red
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(
                            color: Color.fromARGB(255, 140, 138, 138),
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                            color: Color.fromARGB(255, 224, 29, 15),
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 300, left: 15, right: 15),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 203, 39, 27),
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    child: Center(
                      child: InkWell(
                        onTap: () => login(context),
                        child: Text(
                          "LOG IN",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
