import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notices/common/custom_drawer/widgets/icon_tile.dart';
import 'package:notices/stores/drawer_store.dart';
import 'package:provider/provider.dart';

class ListSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DrawerStore _drawerStore = Provider.of<DrawerStore>(context);

    void _setPage(int page) {
      Navigator.of(context).pop();
      _drawerStore.setPageIndex(page);
    }

    return Observer(builder: (_) {
      return Column(
        children: <Widget>[
          IconTile(
            "Ofícios",
            Icons.view_list,
            () {
              _setPage(0);
            },
            _drawerStore.pageIndex == 0 ? true : false,
          ),
        ],
      );
    });
  }
}
