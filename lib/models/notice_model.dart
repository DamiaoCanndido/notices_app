class NoticeModel {
  int number;
  String id;
  String subjects;
  String url;
  String createdAt;

  NoticeModel({this.number, this.id, this.subjects, this.url, this.createdAt});

  NoticeModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    id = json['_id'];
    subjects = json['subjects'];
    url = json['url'];
    createdAt = json['created_At'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['_id'] = this.id;
    data['subjects'] = this.subjects;
    data['url'] = this.url;
    data['created_At'] = this.createdAt;
    return data;
  }

  @override
  String toString() {
    return "{number: ${number.toString()}, id: $id, subjects: $subjects, url: $url, createdAt: $createdAt}";
  }
}
