class ReminderModel {
  bool done;
  String id;
  int number;
  String subjects;
  String deadline;

  ReminderModel(
      {this.done,
      this.id,
      this.number,
      this.subjects,
      this.deadline});

  ReminderModel.fromJson(Map<String, dynamic> json) {
    done = json['done'];
    id = json['_id'];
    number = json['number'];
    subjects = json['subjects'];
    deadline = json['deadline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['done'] = this.done;
    data['_id'] = this.id;
    data['number'] = this.number;
    data['subjects'] = this.subjects;
    data['deadline'] = this.deadline;
    
    return data;
  }
}
