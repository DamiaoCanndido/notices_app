import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notices/common/app_text_field/app_text_field.dart';
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

    if (widget.notice != null) {
      tSubjects.text = widget.notice.subjects;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _noticeStore = Provider.of<NoticeStore>(context);

    if (widget.notice != null) {
      _noticeStore.subjects = widget.notice.subjects;
      _noticeStore.editNotice = widget.notice;
    }
    if (widget.notice == null) {
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Observer(builder: (_) {
                  return AppTextField(
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white),
                    label: "Assunto",
                    controller: tSubjects,
                    errorText: _noticeStore.errorSubjects,
                    keyboardType: TextInputType.text,
                    enabled: true,
                    onChanged: _noticeStore.setSubjects,
                  );
                }),
                SizedBox(
                  height: 32,
                ),
                Observer(builder: (_) {
                  return RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      padding: EdgeInsets.all(10),
                      child: _noticeStore.loading
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : Text(
                              "Salvar",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                      color: Color(0xff000066),
                      disabledColor: Color.fromARGB(100, 0, 0, 102),
                      onPressed: widget.notice != null
                          ? _noticeStore.subjectPressedEdit
                          : _noticeStore.subjectPressed);
                })
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
