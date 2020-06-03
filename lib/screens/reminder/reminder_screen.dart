import 'package:flutter/material.dart';
import 'package:notices/common/custom_drawer/custom_drawer.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {

  List<Map<String, dynamic>> list = [
    {
      "done": false,
      "_id": "5ed62f1039d49b27140ccb0f",
      "number": 20,
      "subjects": "Comer puta",
      "deadline": "2020-06-02T12:00:00.000Z",
    },
    {
      "done": true,
      "_id": "5ed549bb6bd0171d707b86df",
      "number": 30,
      "subjects": "Testando...",
      "deadline": "2020-06-02T14:00:00.000Z",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prazos"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
          return Card(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: list[index]["done"] 
                ? Colors.red[300] 
                : Colors.green[300]
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Checkbox(
                      value: !list[index]["done"], onChanged: null
                    ),
                  ),
                  Container()
                ],
              ),
            ),
          );
        }
      ),
      drawer: CustomDrawer(),
    );
  }
}