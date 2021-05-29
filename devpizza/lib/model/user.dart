class User {
  String name;
  String street;
  String streetNumber;
  String email;
  String password;

  User({this.name, this.email, this.street, this.streetNumber, this.password});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    // TODO: Map database column names from field names

    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    // TODO: Map fields from database column names
  }
}
