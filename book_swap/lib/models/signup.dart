class usermodel {
  String? userid;
  String? email;
  String? firstName;
  String? LastName;

  usermodel({this.userid, this.email, this.firstName, this.LastName});

  // recieve data from server
  factory usermodel.fromMap(map) {
    return usermodel(
        userid: map['userid'],
        email: map['email'],
        firstName: map['firstName'],
        LastName: map['LastName']);
  }

  // send data to server
  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'email': email,
      'firstName': firstName,
      'LastName': LastName,
    };
  }
}
