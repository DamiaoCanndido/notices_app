import 'package:flutter/material.dart';
import 'package:notices/common/custom_drawer/widgets/list_section.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListSection()
        ],
      ),
    );
  }
}