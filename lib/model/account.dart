class Account {
  Account(
      {this.email,
      this.sid,
      this.lastName,
      this.sex,
      this.password,
      this.job,
      this.address,
      this.birthday,
      this.firstName,
      this.phone});

  final int sid;
  final String lastName;
  final String firstName;
  final String sex;
  final String address;
  final String birthday;
  final String password;
  final String job;
  final String phone;
  final String email;

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        email: json['email_add'] as String,
        sid: json['sid'] as int,
        lastName: json['last_name'] as String,
        firstName: json['first_name'] as String,
        sex: json['sex'] as String,
        address: json['address'] as String,
        birthday: json['start_year'] as String,
        password: json['end_year'] as String,
        job: json['genre'] as String);
  }
}
