class NoticeModel {
  int number;
  String id;
  String subjects;
  String createdAt;

  NoticeModel({this.number, this.id, this.subjects, this.createdAt});

  NoticeModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    id = json['_id'];
    subjects = json['subjects'];
    createdAt = json['created_At'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['_id'] = this.id;
    data['subjects'] = this.subjects;
    data['created_At'] = this.createdAt;
    return data;
  }

  @override
  String toString() {
    return "{number: ${number.toString()}, id: $id, subjects: $subjects, createdAt: $createdAt}";
  }
}
