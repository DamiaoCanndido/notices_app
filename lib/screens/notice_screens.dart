import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notices/models/notice_model.dart';
import 'package:notices/screens/notice_create.dart';
import 'package:notices/screens/widgets/notice_list.dart';
import 'package:notices/stores/notice_store.dart';
import 'package:provider/provider.dart';

class NoticeScreen extends StatefulWidget {
  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {

  List<Map<String, String>> list = [
    {"number": "90", "subjects": "Prefeitura", "date":"20-04-2019"},
    {"number": "90", "subjects": "Escritório", "date":"20-04-2019"},
    {"number": "90", "subjects": "Prefeitura", "date":"20-04-2019"},
    {"number": "90", "subjects": "Prefeitura", "date":"20-04-2019"},
    {"number": "90", "subjects": "Prefeitura", "date":"20-04-2019"},
    {"number": "90", "subjects": "Prefeitura", "date":"20-04-2019"},
    {"number": "90", "subjects": "Prefeitura", "date":"20-04-2019"},
    {"number": "90", "subjects": "Prefeitura", "date":"20-04-2019"},
  ];

  NoticeStore _noticeStore;
  List<NoticeModel> notices;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _noticeStore = Provider.of<NoticeStore>(context);
    _noticeStore.getNotice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 250,
            child: Center(
              child: Observer(builder: (_){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("OFÍCIO ATUAL",
                      style: TextStyle(
                        fontSize: 25
                      ),
                    ),
                    _noticeStore.notices != null
                    ? Text(
                      _noticeStore.notices[0].number.toString(),
                      style: TextStyle(
                        fontSize: 60
                      ),
                    )  
                    : CircularProgressIndicator()
                  ],
                );
              })
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 230),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: <Widget>[
                    Observer(builder: (_){
                      return _noticeStore.notices != null 
                      ? NoticeList()
                      : Center(child: CircularProgressIndicator());
                    })
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => NoticeCreate(),
            )
          );
        },
      ),
    );
  }
}