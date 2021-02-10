// final List<Interest> interests = [
//     Interest('Animals'),
//     Interest('Disabilities'),
//     Interest('Education'),
//     Interest('Food'),
//     Interest('Health\nWellness'),
//     Interest('Housing'),
//     Interest('Older Adults'),
//     Interest('Service Trips'),
//     Interest('Veterans'),
//     Interest('Other'),
//   ];

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
