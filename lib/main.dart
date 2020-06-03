import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:notices/screens/base/base_screen.dart';
import 'package:notices/stores/drawer_store.dart';
import 'package:notices/stores/notice_store.dart';
import 'package:notices/stores/reminder_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DrawerStore>(
          create: (_) => DrawerStore(),
        ),
        Provider<NoticeStore>(
          create: (_) => NoticeStore(),
        ),
        Provider<ReminderStore>(
          create: (_) => ReminderStore(),
        ),
      ],
      child: MaterialApp(
        title: 'Notices',
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
          primaryColor: Color(0xFF000066),
          backgroundColor: Colors.white,
          fontFamily: "Comic Neue",
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Colors.white
            ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('pt', 'BR')
        ],
        home: BaseScreen(),
      ),
    );
  }
}
