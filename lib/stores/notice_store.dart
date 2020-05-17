import 'package:mobx/mobx.dart';
import 'package:notices/models/notice_model.dart';
import 'package:notices/repositores/notices_api.dart';
import 'package:notices/utils/api_response.dart';
part 'notice_store.g.dart';

class NoticeStore = _NoticeStoreBase with _$NoticeStore;

abstract class _NoticeStoreBase with Store {

  @observable
  String subjects = "";
  @observable
  bool createdIn = false;
  @observable
  bool loading = false;
  @observable
  bool msgError = false;
  @observable
  List<NoticeModel> notices;
  @observable
  ApiResponse<NoticeModel> notice;
  @observable
  NoticeModel editNotice;

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

    notice = await NoticesApi.createNotice(subjects);

    if(notice.ok){
      loading = false;
      createdIn = true;
    } else {
      loading = false;
      createdIn = false;
    }
  }

  @action
  Future<void> updateNotice() async {
    loading = true;

    notice = await NoticesApi.editNotice(editNotice, subjects);

    if(notice.ok){
      loading = false;
      createdIn = true;
    } else {
      loading = false;
      createdIn = false;
    }
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

  @computed
  Function get subjectPressedEdit => isSubjectsValid && !loading ? updateNotice : null;
  
}