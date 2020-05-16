import 'package:flutter/material.dart';
import 'package:notices/screens/notice_screens.dart';
import 'package:notices/stores/notice_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NoticeStore>(
          create: (_) => NoticeStore(),
        )
      ],
      child: MaterialApp(
        title: 'Notices',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF000066),
          fontFamily: "Comic Neue",
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Colors.white
            ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: NoticeScreen(),
      ),
    );
  }
}
