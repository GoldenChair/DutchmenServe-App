import 'dart:convert';

class Interest {
  int id;
  String interest;

  Interest(String interest, {int id}) {
    this.interest = interest;
    this.id = id;
  }

  Map<String, dynamic> toJson() => {
        'interest': interest,
        'id': id,
      };

  Interest.fromJson(Map<String, dynamic> json) {
    id = json['id']; // will be filled in by database
    interest = json['interest'];
  }

  void printInterest() {
    print(id.toString() + ': ' + interest);
  }
}
