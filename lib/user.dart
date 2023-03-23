class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String roles;
  String details;
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.roles,
    required this.details,
  });

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['email'] = email;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['roles'] = roles;
    json['details'] = details;
    return json;
  }
}
