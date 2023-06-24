import 'dart:convert';

import 'package:apitest/customwidget.dart';
import 'package:apitest/getdataModel.dart';
import 'package:apitest/loginpage.dart';
import 'package:apitest/shrd.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Future<GetData> data() async {
    var set=await getShared();
    print(set);
    String url =
        "https://lead-management-api.foxa.in/api/v1/lead/follow_up_list/";
    var result = await http.get(Uri.parse(url), headers: {
      "Authorization":"Token $set"
    });
    print(result.body);

    final res = jsonDecode(result.body);
    final data = GetData.fromJson(res);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        ),
        title: Text(
          "Followups List",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      deletShared();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => loginpage(),
                      ));
                    },
                    child: Icon(
                      Icons.logout,
                      color: Colors.black,
                      size: 30,
                    ))
              ],
            ),
          )
        ],
      ),
      body: FutureBuilder(
          future: data(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              Center(child: Text("No Data"));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "Priority",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.keyboard_arrow_down_rounded),
                            ],
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "Filter",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.keyboard_arrow_down_rounded),
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return customwidget(
                          data: snapshot.data!.data.leads[index],
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                            color: Colors.transparent,
                          ),
                      itemCount: snapshot.data!.data.leads.length),
                )
              ],
            );
          }),
    );
  }
}
