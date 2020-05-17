import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notices/models/notice_model.dart';
import 'package:notices/stores/notice_store.dart';
import 'package:provider/provider.dart';

class NoticeCreate extends StatefulWidget {

  final NoticeModel notice;

  NoticeCreate({this.notice});

  @override
  _NoticeCreateState createState() => _NoticeCreateState();
}

class _NoticeCreateState extends State<NoticeCreate> {

  NoticeStore _noticeStore;
  final tSubjects = TextEditingController();

  @override
  void initState() {
    super.initState();

    if(widget.notice != null){
      tSubjects.text = widget.notice.subjects;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _noticeStore = Provider.of<NoticeStore>(context);

    if(widget.notice != null){
      _noticeStore.subjects = widget.notice.subjects;
      _noticeStore.editNotice = widget.notice;
    }
    if(widget.notice == null){
      _noticeStore.subjects = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.notice != null 
          ? Text(widget.notice.number.toString())
          : Text("Novo ofício"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Observer(
              builder: (_){
                return TextFormField(
                  controller: tSubjects,
                  minLines: 1,
                  maxLines: 10,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onChanged: _noticeStore.setSubjects,
                  decoration: InputDecoration(
                    labelText: "Assunto",
                    errorText: _noticeStore.errorSubjects,
                    labelStyle: TextStyle(
                      fontSize: 21,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                );
              }
            ),
            Observer(builder: (_){
              return RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: EdgeInsets.all(10),
                child: _noticeStore.loading 
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                )
                : Text("Salvar",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white
                  ),
                ),
                color: Theme.of(context).primaryColor,
                disabledColor: Color.fromARGB(100, 0, 0, 102),
                onPressed: _noticeStore.editNotice != null 
                  ? _noticeStore.subjectPressedEdit 
                  : _noticeStore.subjectPressed
              );
            })
          ],
        ),
      ),
    );
  }
}