import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notices/common/req_alert.dart';
import 'package:notices/models/notice_model.dart';
import 'package:notices/screens/notice_create.dart';
import 'package:notices/stores/notice_store.dart';
import 'package:notices/utils/date_formatter.dart';
import 'package:provider/provider.dart';

class NoticeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final NoticeStore _noticeStore = Provider.of<NoticeStore>(context);
    List<NoticeModel> notices = _noticeStore.notices;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _noticeStore.notices.length,
      itemBuilder: (context, index){

        NoticeModel n = notices[index];

        void delete() async {
          await Provider.of<NoticeStore>(context, listen: false).deleteNotice(n);
        }

        return ListTile(
          leading: Text(
            n.number.toString(),
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 22
            )
          ),
          title: Text(
            n.subjects,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text( 
            DateFormatter.format(n.createdAt),
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => NoticeCreate(notice: n),
              )
            );
          },
          onLongPress: (){
            alert(context, "Deseja realmente excluir o ofício ${n.number.toString()}", callback: delete);
          },
        );
      }
    );
  }
}