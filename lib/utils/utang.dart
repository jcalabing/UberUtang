class Utang {
  int id;
  String name;
  int amount;
  String about;
  String utangdate;

  Utang({this.id, this.name, this.amount, this.about, this.utangdate});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'amount': amount,
      'about': about,
      'utangdate': utangdate
    };
    return map;
  }

  Utang.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    amount = map['amount'];
    about = map['about'];
    utangdate = map['utangdate'];
  }
}
