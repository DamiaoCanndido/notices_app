import 'package:flutter/material.dart';
import 'package:notices/common/req_alert.dart';
import 'package:notices/models/notice_model.dart';
import 'package:notices/screens/notices/notice_create.dart';
import 'package:notices/stores/notice_store.dart';
import 'package:notices/utils/date_formatter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NoticeStore _noticeStore = Provider.of<NoticeStore>(context);
    List<NoticeModel> notices = _noticeStore.notices;

    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _noticeStore.notices.length,
        itemBuilder: (context, index) {
          NoticeModel n = notices[index];

          void delete() async {
            await Provider.of<NoticeStore>(context, listen: false)
                .deleteNotice(n);
          }

          Future<void> openPdf() async {
            final String urlPdf = n.url;
            if (n.url != null) {
              if (await canLaunch(urlPdf)) {
                await launch(urlPdf);
              } else {
                throw "Not open";
              }
            }
          }

          return GestureDetector(
            onTap: () {
              openPdf();
            },
            onDoubleTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoticeCreate(notice: n),
                ),
              );
            },
            onLongPress: () {
              alert(
                context,
                "Deseja realmente excluir o ofício ${n.number.toString()}",
                callback: delete,
              );
            },
            child: Container(
              padding: EdgeInsets.all(4),
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(200, 17, 23, 196),
                      ),
                      child: Text(
                        n.number.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Color.fromARGB(200, 17, 23, 196),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Text(n.subjects),
                              padding: EdgeInsets.only(top: 4),
                              alignment: Alignment.topLeft,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                DateFormatter.format(n.createdAt),
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

// ListTile(
//             leading: Text(n.number.toString(),
//                 style: TextStyle(
//                     color: Colors.red,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 22)),
//             title: Text(
//               n.subjects,
//               overflow: TextOverflow.ellipsis,
//             ),
//             subtitle: Text(
//               DateFormatter.format(n.createdAt),
//               style: TextStyle(
//                   color: Theme.of(context).primaryColor, fontSize: 10),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => NoticeCreate(notice: n),
//                   ));
//             },
//             onLongPress: () {
//               alert(context,
//                   "Deseja realmente excluir o ofício ${n.number.toString()}",
//                   callback: delete);
//             },
//           );
