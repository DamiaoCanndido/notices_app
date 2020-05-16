import 'package:mobx/mobx.dart';
import 'package:notices/models/notice_model.dart';
import 'package:notices/repositores/notices_api.dart';
part 'notice_store.g.dart';

class NoticeStore = _NoticeStoreBase with _$NoticeStore;

abstract class _NoticeStoreBase with Store {

  @observable
  String subjects = "";
  @observable
  bool loggedIn = false;
  @observable
  bool loading = false;
  @observable
  bool msgError = false;
  @observable
  List<NoticeModel> notices;

  @action
  void setSubjects(String value) { 
    subjects = value;
  }

  @action
  Future<void> getNotice() async {
    notices = await NoticesApi.getNotices();
    notices.map((e) => e.number.toString());
  }

  @action
  Future<void> createNotice() async {
    loading = true;

    await Future.delayed(Duration(seconds: 3));

    loading = false;
  }

  @computed
  bool get isSubjectsValid => subjects.trim().length >= 3;

  @computed
  String get errorSubjects => 
    !isSubjectsValid && subjects.trim().length > 0
    ? "Comente algo"
    : null;

  @computed
  Function get subjectPressed => isSubjectsValid && !loading ? createNotice : null;
  
}