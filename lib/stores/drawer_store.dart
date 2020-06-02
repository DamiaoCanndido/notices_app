import 'package:mobx/mobx.dart';
part 'drawer_store.g.dart';

class DrawerStore = _DrawerStoreBase with _$DrawerStore;

abstract class _DrawerStoreBase with Store {

  // Modificar tela de início também.
  @observable
  int pageIndex = 0;

  // Modificar no botão de sair.
  @action
  void setPageIndex(int value) => pageIndex = value;
  
}