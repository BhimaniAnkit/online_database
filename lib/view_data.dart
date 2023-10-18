import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class view_data extends StatefulWidget {
  const view_data({Key? key}) : super(key: key);

  @override
  State<view_data> createState() => _view_dataState();
}

class _view_dataState extends State<view_data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(future: get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {

            List m=snapshot.data as List;
            return ListView.builder(
              itemCount: m.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${m[index]['name']}"),
                  trailing: Wrap(
                    children: [
                      IconButton(onPressed: () async {
                        var url = Uri.parse('https://gautamflutter.000webhostapp.com/delete.php?id=${m[index]['id']}');
                        var response = await http.get(url);
                        print('Response status: ${response.statusCode}');
                        print('Response body: ${response.body}');
                        setState(() {});
                      }, icon: Icon(Icons.delete))
                    ],
                  ),

                );
              },
            );
          }
          else
            {
               return CircularProgressIndicator();
            }
        },
      ),
    );
  }



  get() async {
    var url =
        Uri.parse('https://gautamflutter.000webhostapp.com/view_data1.php');
    var response = await http.get(url);

    List l = jsonDecode(response.body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print(l);
    return l;
  }
}
