import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_database/view_data.dart';

void main()
{
    runApp(MaterialApp(home: first(),));
}
class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: t1,
          ),
          TextField(
            controller: t2,
          ),
          ElevatedButton(onPressed: () async {
           String  name=t1.text;
           String  contact=t2.text;

            var url = Uri.parse('https://gautamflutter.000webhostapp.com/first.php?name=$name&contact=$contact');
            var response = await http.get(url);
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');


          }, child: Text("Submit")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
               return view_data();
            },));
          }, child: Text("View"))
        ],
      ),
    );
  }
}
