import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:notices/screens/notices/notice_screens.dart';
import 'package:notices/screens/reminder/reminder_screen.dart';
import 'package:notices/stores/drawer_store.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  final PageController _pageController = PageController();

  DrawerStore _drawerStore;
  ReactionDisposer disposerDrawer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final DrawerStore drawerStore = Provider.of<DrawerStore>(context);
    if(drawerStore != _drawerStore){
      _drawerStore = drawerStore;
    }
    disposerDrawer = autorun((_){
      _pageController.jumpToPage(drawerStore.pageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          NoticeScreen(),
          ReminderScreen(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    disposerDrawer();
  }
}