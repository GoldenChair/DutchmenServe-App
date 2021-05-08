class Interest {
  int id;
  String interest;
  int iconDataConstant;

  Interest(String interest, int iconConst, {int id}) {
    this.interest = interest;
    this.id = id;
    iconDataConstant = iconConst;
  }

  Map<String, dynamic> toJson() => {
        'interest': interest,
        'id': id,
        'iconDataConstant': iconDataConstant,
      };

  Interest.fromJson(Map<String, dynamic> json) {
    id = json['id']; // will be filled in by database
    interest = json['interest'];
    iconDataConstant = json['iconDataConstant'];
  }

  void printInterest() {
    print(id.toString() + ': ' + interest + ', ' + iconDataConstant.toString());
  }
}
